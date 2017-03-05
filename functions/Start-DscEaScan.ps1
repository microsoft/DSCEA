function Start-DSCEAScan {
<#   
.SYNOPSIS   
Will run Test-DscConfiguration -ReferenceConfiguration against the remote systems listed in $env:ProgramFiles\DSC-EA\computers.ps1 and saves the results to a XML file in $env:ProgramFiles\DSC-EA\Output

.DESCRIPTION 
Run this function after you have a list of remote systems to scan and a localhost.MOF file created that defines the settings you want to check against.

.NOTES   

.LINK
http://aka.ms/dscea

.EXAMPLE
. Start-DscEaScan
#>
[CmdletBinding()]
param
    (
        [ValidateNotNullOrEmpty()]
        [string]$OutputPath = '.',

        [ValidateNotNullOrEmpty()]
        [string]$LogsPath = '.',

        [ValidateNotNullOrEmpty()]
        [string]$MofFile = '.\localhost.mof',

        [string]$InputFile,

        [ValidateNotNullOrEmpty()]
        [string]$JobTimeout = 600,

        [ValidateNotNullOrEmpty()]
        [string]$ScanTimeout = 3600,

        [boolean]$ForceScan = $False,

        [ValidateNotNullOrEmpty()]
        [string]$ResultsFile = "results.$(Get-Date -Format 'yyyyMMdd-HHmm-ss').xml",

        [string[]]$ComputerName,

        [Microsoft.Management.Infrastructure.CimSession[]]$CimSession
    )

    #Begin DSC-EA Engine
    Write-Verbose "DSC-EA Scan has started"
    $runspacePool = [RunspaceFactory]::CreateRunspacePool(1, 10).Open() #Min Runspaces, Max Runspaces
    $scriptBlock = {
        param (
            [ValidateNotNullOrEmpty()]
            [string]$computer,

            [ValidateScript({Test-Path $_ })]
            [string]$mofFile,

            [ValidateNotNullOrEmpty()]
            [string]$JobTimeout,

            [boolean]$ForceScan,

            [Microsoft.Management.Infrastructure.CimSession]$CimSession
            )

            function kill-DSCEngine {
                [CmdletBinding()]
                param
                (
                    [ValidateNotNullOrEmpty()]
                    [string[]]$ComputerName
                )

                #kill the dsc processes on the remote system
                Invoke-Command -ComputerName $ComputerName -ScriptBlock {
        
                    ### find the process that is hosting the DSC engine
                    $dscProcess = Get-WmiObject msft_providers | 
                    Where-Object {$_.provider -like 'dsccore'} | 
                    Select-Object -ExpandProperty HostProcessIdentifier 
        
                    ### Stop the process
                    do {
                        $processID = Get-Process -Id $dscProcess
                        $processID | Stop-Process -Force}
                    while ($processID.ProcessName -match "WmiPrvSE")
                } -ErrorAction SilentlyContinue
            }

        $runTime = Measure-Command {
            try
            {
                if ($ForceScan) {
                    for ($i=1; $i -lt 10; $i++) { 
                        kill-DSCEngine -ComputerName $computer -ErrorAction SilentlyContinue
                    }
                }
                if($PSBoundParameters.ContainsKey('CimSession')) {
                    $DSCJob = Test-DSCConfiguration -ReferenceConfiguration $mofFile -CimSession $CimSession -AsJob | Wait-Job -Timeout $JobTimeout
                }
                else {
                    $DSCJob = Test-DSCConfiguration -ReferenceConfiguration $mofFile -CimSession $computer -AsJob | Wait-Job -Timeout $JobTimeout
                }
                if (!$DSCJob) { 
                    $JobFailedError = "$computer was unable to complete in the alloted job timeout period of $JobTimeout seconds"
                    for ($i=1; $i -lt 10; $i++) { 
                        kill-DSCEngine -ComputerName $computer -ErrorAction SilentlyContinue
                    }
                    return
                }
                $compliance = Receive-Job $DSCJob -ErrorVariable JobFailedError
                Remove-Job $DSCJob            
            }
            catch {
                $JobFailedError = $_
            } 
        }
        return [PSCustomObject]@{
            Computer = $computer
            RunTime = $runTime
            Compliance = $compliance
            Exception = $JobFailedError
        }
    }

    $jobs = @()
    $results = @()

    if($PSBoundParameters.ContainsKey('CimSession')) {
        $CimSession | ForEach-Object {
            $params = @{
                CimSession = $_
                MofFile = $MofFile
                JobTimeout = $JobTimeout
                ForceScan = $ForceScan
            }
            $job = [Powershell]::Create().AddScript($scriptBlock).AddParameters($params)
            Write-Verbose ('Initiating DSC-EA scan on {0}' -f $_.ComputerName)
		    $job.RunSpacePool = $runspacePool
            $jobs += [PSCustomObject]@{
                    Pipe = $job
                    Result = $job.BeginInvoke()
            }
        }
    }
    else {
        Write-Verbose "Testing connectivity and PowerShell version of remote systems (All Systems must be running PowerShell 5)"
    
        if($PSBoundParameters.ContainsKey('ComputerName')){
            $firstrunlist = $ComputerName
        }
        else {
            $firstrunlist = (Get-Content $$InputFile)
        }

        $psresults = Invoke-Command -ComputerName $firstrunlist -ErrorAction SilentlyContinue -AsJob -ScriptBlock {
            $PSVersionTable.PSVersion
        } | Wait-Job -Timeout 120
        $psjobresults = Receive-Job $psresults

        $runlist =  ($psjobresults | where-object -Property Major -ge 5).PSComputername
        $versionerrorlist =  ($psjobresults | where-object -Property Major -lt 5).PSComputername

        $PSVersionErrorsFile = Join-Path -Path $LogsPath -Childpath ('PSVersionErrors.{0}.xml' -f (Get-Date -Format 'yyyyMMdd-HH:mm:ss'))
    
        Write-Verbose "Connectivity testing complete"
        if ($versionerrorlist){
            Write-Warning "The following systems cannot be scanned as they are not running PowerShell 5.  Please check '$versionerrorlist' for details"
        }
        $RunList | Sort-Object | ForEach-Object {
            $params = @{
                Computer = $_
                MofFile = $MofFile
                JobTimeout = $JobTimeout
                ForceScan = $ForceScan
            }
            $job = [Powershell]::Create().AddScript($scriptBlock).AddParameters($params)
            Write-Verbose "Initiating DSC-EA scan on $_"
		    $job.RunSpacePool = $runspacePool
            $jobs += [PSCustomObject]@{
                    Pipe = $job
                    Result = $job.BeginInvoke()
            }
        }
    }

    #Wait for Jobs to Complete
    Write-Verbose "Processing Compliance Testing..."
    $overalltimeout = new-timespan -Seconds $ScanTimeout
    $elapsedTime = [system.diagnostics.stopwatch]::StartNew()
    do {
        Start-Sleep -Milliseconds 500
        $jobscomplete = ($jobs.result.iscompleted | Where-Object {$_ -eq $true}).count

        #pecentage complete can be added as the number of jobs completed out of the number of total jobs
        Write-Progress -activity "Working..." -PercentComplete (($jobscomplete / $jobs.count)*100) -status "$([string]::Format("Time Elapsed: {0:d2}:{1:d2}:{2:d2}     Jobs Complete: {3} of {4} ", $elapsedTime.Elapsed.hours, $elapsedTime.Elapsed.minutes, $elapsedTime.Elapsed.seconds, $jobscomplete, $jobs.count))";
       
        if ($elapsedTime.elapsed -gt $overalltimeout) {
            Write-Warning "The DSC-EA scan was unable to complete because the timeout value of" $overalltimeout.TotalSeconds "seconds was exceeded." -ForegroundColor Red
            return
        }
    } while (($jobs.Result.IsCompleted -contains $false) -and ($elapsedTime.elapsed -lt $overalltimeout)) #while elasped time < 1 hour by default

    #Retrieve Jobs
    $jobs | ForEach-Object {
        $results += $_.Pipe.EndInvoke($_.Result)
    }

    ForEach ($exceptionwarning in $results.Exception) {
        Write-Warning $exceptionwarning
    }

    #Save Results
    Write-Verbose "$([string]::Format("Total Scan Time: {0:d2}:{1:d2}:{2:d2}", $elapsedTime.Elapsed.hours, $elapsedTime.Elapsed.minutes, $elapsedTime.Elapsed.seconds))"
    $results | Export-Clixml -Path (Join-Path  -Path $OutputPath -Child $ResultsFile) -Force
    Get-ItemProperty (Join-Path  -Path $OutputPath -Child $ResultsFile)

    #currently presents an ugly divide by zero message if the only systems in the list are below PowerShell 5
    if ($versionerrorlist){
        #add in comma separated option for multiple systems
        Write-Warning "The DSC-EA scan completed but did not scan all systems.  Please check '$PSVersionErrorsFile' for details"
        $versionerrorlist | Export-Clixml -Path $PSVersionErrorsFile -Force
    }

    if ($results.Exception){
        Write-Warning "The DSC-EA scan completed but job errors were detected.  Please check '$ResultsFile' for details"
    }

}
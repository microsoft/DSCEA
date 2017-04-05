function Start-DSCEAscan {
<#   
.SYNOPSIS   
Will run Test-DscConfiguration -ReferenceConfiguration using the provided MOF file against the remote systems supplied and saves the scan results to a XML file

.DESCRIPTION 
Run this function after you have defined the remote systems to scan and have created a MOF file that defines the settings you want to check against

.PARAMETER MofFile
The file name (full file path) to the MOF file you are looking to use with DSCEA to perform a scan.  If no value is provided, Start-DSCEAscan will look into the current directory for a file named localhost.mof

.PARAMETER ComputerName
Comma seperated list of computer names that you want to scan

.PARAMETER InputFile
The file name (full file path) to a text file that contains a list of computers you want to scan

.PARAMETER CimSession
Provide DSCEA with a CimSession object to perform compliance scans against remote systems that are either not members of the same domain as the management system, are workgroup systems or require other credentials

.PARAMETER Path
Provide DSCEA with a folder path containing machine specific MOF files to allow for a scan of those systems against unique per system settings

.PARAMETER ResultsFile
The file name for the DSCEA scan results XML file.  If no value is provided, a time based file name will be auto-generated.

.PARAMETER OutputPath
The full file path for the DSCEA scan results XML file.  The defined path must already exist. If no value is provided, the result XML file will be saved to the current directory.

.PARAMETER LogsPath
The full file path for the any DSCEA scan log files.  The defined path must already exist. If no value is provided, log files will be saved to the current directory.

.PARAMETER JobTimeout
Individual system timeout (seconds) If no value is provided, the default value of 600 seconds will be used.

.PARAMETER ScanTimeout
Total DSCEA scan timeout (seconds)  If no value is provided, the default value of 3600 seconds will be used.

.PARAMETER Force
The force parameter attempts to close any running DSC related processes on systems being scanned before a scan begins to avoid LCM conflicts.  Force is not enabled by default.

.LINK
https://microsoft.github.io/DSCEA

.EXAMPLE
Start-DSCEAscan -MofFile .\localhost.mof -ComputerName dsctest-1, dsctest-2, dsctest-3

Description
-----------
This command executes a DSCEA scan against 3 remote systems, dsctest-1, dsctest-2 and dsctest-3 using a locally defined MOF file that exists in the current directory. This MOF file specifies the settings to check for during the scan. Start-DSCEAscan returns a XML results file containing raw data that can be used with other functions, such as Get-DSCEAreport to create reports with consumable information.

.EXAMPLE
Start-DSCEAscan -MofFile C:\Users\username\Documents\DSCEA\localhost.mof -ComputerName dsctest-1, dsctest-2, dsctest-3

Description
-----------
This command executes a DSCEA scan against 3 remote systems, dsctest-1, dsctest-2 and dsctest-3 using a locally defined MOF file that exists at "C:\Users\username\Documents\DSCEA". This MOF file specifies the settings to check for during the scan. Start-DSCEAscan returns a XML results file containing raw data that can be used with other functions, such as Get-DSCEAreport to create reports with consumable information.

.EXAMPLE
Start-DSCEAscan -MofFile .\localhost.mof -InputFile C:\Users\username\Documents\DSCEA\computers.txt

Description
-----------
This command executes a DSCEA scan against the systems listed within "C:\Users\username\Documents\DSCEA\computers.txt" using a locally defined MOF file that exists in the current directory. This MOF file specifies the settings to check for during the scan. Start-DSCEAscan returns a XML results file containing raw data that can be used with other functions, such as Get-DSCEAreport to create reports with consumable information.

.EXAMPLE
Start-DSCEAscan -MofFile C:\Users\username\Documents\DSCEA\localhost.mof -InputFile C:\Users\username\Documents\DSCEA\computers.txt

Description
-----------
This command executes a DSCEA scan against the systems listed within "C:\Users\username\Documents\DSCEA\computers.txt" using a locally defined MOF file that exists at "C:\Users\username\Documents\DSCEA". This MOF file specifies the settings to check for during the scan. Start-DSCEAscan returns a XML results file containing raw data that can be used with other functions, such as Get-DSCEAreport to create reports with consumable information.

.EXAMPLE
Start-DSCEAscan -MofFile C:\Users\username\Documents\DSCEA\localhost.mof -ComputerName dsctest-1, dsctest-2, dsctest-3 -OutputPath C:\Temp\DSCEA\Output -ResultsFile "results.xml" -LogsPath C:\Temp\DSCEA\Logs -JobTimeout 10 -ScanTimeout 60 -Force -Verbose

Description
-----------
This command executes a DSCEA scan against 3 remote systems, dsctest-1, dsctest-2 and dsctest-3 using a locally defined MOF file that exists at "C:\Users\username\Documents\DSCEA". This MOF file specifies the settings to check for during the scan. Start-DSCEAscan returns a XML results file containing raw data that can be used with other functions, such as Get-DSCEAreport to create reports with consumable information.
This example specifies custom values for -OutputPath and -LogsPath, which must be directories that are pre-existing to store results and logs from the scan. This scan also specifies custom values for -ResultsFile to provide the file name of the scan results file, -JobTimeout and -ScanTimeout which provide new timeout values for individual system timeouts and the overall scan timeout, a -Force option which attempts to close any running DSC related processes on systems being scanned before a scan begins to avoid LCM conflicts and -Verbose, which will provide full verbose output of the scan process.

.EXAMPLE
$UserName = 'LocalUser'
$Password = ConvertTo-SecureString -String "P@ssw0rd" -AsPlainText -Force
$Servers = "dsctest-4,dsctest-5,dsctest-6"
$Cred =  New-Object System.Management.Automation.PsCredential -ArgumentList $UserName, $Password
$Sessions = New-CimSession -Authentication Negotiate -ComputerName $Servers -Credential $Cred
Start-DscEaScan -CimSession $Sessions -MofFile C:\Users\username\Documents\DSCEA\localhost.mof -Verbose

Description
-----------
This command utilizes New-CimSession and executes a DSCEA scan against 3 remote non-domain systems, dsctest-4, dsctest-5 and dsctest-6 using a locally defined MOF file that exists at "C:\Users\username\Documents\DSCEA". This MOF file specifies the settings to check for during the scan. Start-DSCEAscan returns a XML results file containing raw data that can be used with other functions, such as Get-DSCEAreport to create reports with consumable information.

.EXAMPLE
Start-DSCEAscan -Path 'C:\Users\username\Documents\DSCEA\MOFFiles'

Description
-----------
This command executes a DSCEA scan against the systems supplied as machine specific MOF files stored inside 'C:\Users\username\Documents\DSCEA\MOFFiles'. Start-DSCEAscan returns a XML results file containing raw data that can be used with other functions, such as Get-DSCEAreport to create reports with consumable information.
#>
[CmdletBinding()]
param
    (
        [ValidateNotNullOrEmpty()]
        [string]$OutputPath = '.',

        [ValidateNotNullOrEmpty()]
        [string]$LogsPath = '.',

        [parameter(Mandatory=$true,ParameterSetName='ComputerName')]
        [parameter(Mandatory=$true,ParameterSetName='InputFile')]
        [parameter(Mandatory=$true,ParameterSetName='CimSession')]
        [ValidatePattern("\.mof$")]
        [string]$MofFile,

        [parameter(Mandatory=$true,ParameterSetName='InputFile')]
        [string]$InputFile,

        [ValidateNotNullOrEmpty()]
        [string]$JobTimeout = 600,

        [ValidateNotNullOrEmpty()]
        [string]$ScanTimeout = 3600,

        [switch]$Force,

        [ValidateNotNullOrEmpty()]
        [string]$ResultsFile = "results.$(Get-Date -Format 'yyyyMMdd-HHmm-ss').xml",

        [parameter(Mandatory=$true,ParameterSetName='ComputerName')]
        [string[]]$ComputerName,

        [parameter(Mandatory=$true,ParameterSetName='CimSession')]
        [Microsoft.Management.Infrastructure.CimSession[]]$CimSession,

        [parameter(Mandatory=$true,ParameterSetName='Path')]
        [string]$Path
    )

    #Begin DSCEA Engine
    Write-Verbose "DSCEA Scan has started"
    
    $runspacePool = [RunspaceFactory]::CreateRunspacePool(1, 10).Open() #Min Runspaces, Max Runspaces
    $scriptBlock = {
        param (
            [ValidateNotNullOrEmpty()]
            [string]$computer,

            [ValidateScript({Test-Path $_ })]
            [string]$mofFile,

            [ValidateNotNullOrEmpty()]
            [string]$JobTimeout,

            [switch]$Force,

            $ModulesRequired,

            [Microsoft.Management.Infrastructure.CimSession]$CimSession,

            [string]$functionRoot
            )

        Get-ChildItem -Path $functionRoot -Filter '*.ps1' | ForEach-Object {
            . $_.FullName | Out-Null
        }   

        $runTime = Measure-Command {
            try
            {
                if ($PSBoundParameters.ContainsKey('Force')) {
                    for ($i=1; $i -lt 10; $i++) { 
                        Repair-DSCEngine -ComputerName $computer -ErrorAction SilentlyContinue
                    }
                }
                #Copy resources if required
                if ($ModulesRequired -ne $null) {
                    if($CimSession) {
                        $session = New-PSSession -ComputerName $CimSession.ComputerName
                    }
                    else {
                        $session = New-PSSession -ComputerName $Computer
                    }
                    Copy-DSCResource -PSSession $session -ModulestoCopy $ModulesRequired
                    Remove-PSSession $session
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
                        Repair-DSCEngine -ComputerName $computer -ErrorAction SilentlyContinue
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

        if($PSBoundParameters.ContainsKey('CimSession'))
        {
            return [PSCustomObject]@{
                RunTime = $runTime
                Compliance = $compliance
                Exception = $JobFailedError
                Computer = $cimsession.ComputerName
            }
        } else {
            return [PSCustomObject]@{
                RunTime = $runTime
                Compliance = $compliance
                Exception = $JobFailedError
                Computer = $computer
            }
        }
    }

    $jobs = @()
    $results = @()

    if($PSBoundParameters.ContainsKey('Path')) {
        $targets = Get-ChildItem -Path $Path | Where-Object {($_.Name -like '*.mof') -and ($_.Name -notlike '*.meta.mof')}
        $targets | Sort-Object | ForEach-Object {
            $params = @{
                Computer = $_.BaseName
                MofFile = $_.FullName
                JobTimeout = $JobTimeout
                ModulesRequired = Get-MOFRequiredModules -mofFile $_.FullName
                FunctionRoot = $functionRoot
            }
            if ($PSBoundParameters.ContainsKey('Force')) {
                $params += @{Force = $true}
            }
            $job = [Powershell]::Create().AddScript($scriptBlock).AddParameters($params)
            Write-Verbose "Initiating DSCEA scan on $_"
		    $job.RunSpacePool = $runspacePool
            $jobs += [PSCustomObject]@{
                    Pipe = $job
                    Result = $job.BeginInvoke()
            }
        }
    }

    if($PSBoundParameters.ContainsKey('CimSession')) {
        $MofFile = (Get-Item $MofFile).FullName
        $ModulesRequired = Get-MOFRequiredModules -mofFile $MofFile
        $CimSession | ForEach-Object {
            $params = @{
                CimSession = $_
                MofFile = $MofFile
                JobTimeout = $JobTimeout
                ModulesRequired = $ModulesRequired
                FunctionRoot = $functionRoot
            }
            if($PSBoundParameters.ContainsKey('Force')) {
                $params += @{Force = $true}
            }
            $job = [Powershell]::Create().AddScript($scriptBlock).AddParameters($params)
            Write-Verbose ('Initiating DSCEA scan on {0}' -f $_.ComputerName)
		    $job.RunSpacePool = $runspacePool
            $jobs += [PSCustomObject]@{
                    Pipe = $job
                    Result = $job.BeginInvoke()
            }
        }
    }

    if($PSBoundParameters.ContainsKey('ComputerName')){
        $MofFile = (Get-Item $MofFile).FullName
        $ModulesRequired = Get-MOFRequiredModules -mofFile $MofFile
        $firstrunlist = $ComputerName
        $psresults = Invoke-Command -ComputerName $firstrunlist -ErrorAction SilentlyContinue -AsJob -ScriptBlock {
            $PSVersionTable.PSVersion
        } | Wait-Job -Timeout $JobTimeout
        $psjobresults = Receive-Job $psresults

        $runlist =  ($psjobresults | where-object -Property Major -ge 5).PSComputername
        $versionerrorlist =  ($psjobresults | where-object -Property Major -lt 5).PSComputername

        $PSVersionErrorsFile = Join-Path -Path $LogsPath -Childpath ('PSVersionErrors.{0}.xml' -f (Get-Date -Format 'yyyyMMdd-HHmm-ss'))
    
        Write-Verbose "Connectivity testing complete"
        if ($versionerrorlist){
            Write-Warning "The following systems cannot be scanned as they are not running PowerShell 5.  Please check '$versionerrorlist' for details"
        }
        $RunList | Sort-Object | ForEach-Object {
            $params = @{
                Computer = $_
                MofFile = $MofFile
                JobTimeout = $JobTimeout
                ModulesRequired = $ModulesRequired
                FunctionRoot = $functionRoot
            }
            if ($PSBoundParameters.ContainsKey('Force')) {
                $params += @{Force = $true}
            }
            $job = [Powershell]::Create().AddScript($scriptBlock).AddParameters($params)
            Write-Verbose "Initiating DSCEA scan on $_"
		    $job.RunSpacePool = $runspacePool
            $jobs += [PSCustomObject]@{
                    Pipe = $job
                    Result = $job.BeginInvoke()
            }
        }
    }

    if($PSBoundParameters.ContainsKey('InputFile')){
        $MofFile = (Get-Item $MofFile).FullName
        $ModulesRequired = Get-MOFRequiredModules -mofFile $MofFile
        $firstrunlist = Get-Content $InputFile
        $psresults = Invoke-Command -ComputerName $firstrunlist -ErrorAction SilentlyContinue -AsJob -ScriptBlock {
            $PSVersionTable.PSVersion
        } | Wait-Job -Timeout $JobTimeout
        $psjobresults = Receive-Job $psresults

        $runlist =  ($psjobresults | where-object -Property Major -ge 5).PSComputername
        $versionerrorlist =  ($psjobresults | where-object -Property Major -lt 5).PSComputername

        $PSVersionErrorsFile = Join-Path -Path $LogsPath -Childpath ('PSVersionErrors.{0}.xml' -f (Get-Date -Format 'yyyyMMdd-HHmm-ss'))
    
        Write-Verbose "Connectivity testing complete"
        if ($versionerrorlist){
            Write-Warning "The following systems cannot be scanned as they are not running PowerShell 5.  Please check '$versionerrorlist' for details"
        }
        $RunList | Sort-Object | ForEach-Object {
            $params = @{
                Computer = $_
                MofFile = $MofFile
                JobTimeout = $JobTimeout
                ModulesRequired = $ModulesRequired
                FunctionRoot = $functionRoot
            }
            if ($PSBoundParameters.ContainsKey('Force')) {
                $params += @{Force = $true}
            }
            $job = [Powershell]::Create().AddScript($scriptBlock).AddParameters($params)
            Write-Verbose "Initiating DSCEA scan on $_"
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
            Write-Warning "The DSCEA scan was unable to complete because the timeout value of $($overalltimeout.TotalSeconds) seconds was exceeded."
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

    #This function will display a divide by zero message if no computers are provided that are runnning PowerShell 5 or above
    if ($versionerrorlist){
        #add in comma separated option for multiple systems
        Write-Warning "The DSCEA scan completed but did not scan all systems.  Please check '$PSVersionErrorsFile' for details"
        $versionerrorlist | Export-Clixml -Path $PSVersionErrorsFile -Force
    }

    if ($results.Exception){
        Write-Warning "The DSCEA scan completed but job errors were detected.  Please check '$ResultsFile' for details"
    }

}
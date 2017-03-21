function Get-DSCEAreport {
<#   
.SYNOPSIS   
Generate a HTML based report after Start-DSCEAscan has been run

.DESCRIPTION 
Used to create viewable reports after Start-DSCEAscan has created a results.xml file which will be parsed 

.PARAMETER ItemName
This is the item name from the configuration file, used to generate a report of every machine's compliance against that item

.PARAMETER ComputerName
The computer name here will cause the report to display all items (true/false) pertaining to ComputerName

.PARAMETER Overall
Switch parameter indicating that the report generated will display true/false per computer in regards to the entire configuration file

.PARAMETER Detailed
Switch parameter indicating that the report generated will display all non-compliant configuration file items detected, grouped by computer

.LINK
https://microsoft.github.io/DSCEA

.EXAMPLE
Get-DSCEAreport -ItemName MicrosoftAntimalwareService

Description
-----------
This command returns all systems that were scanned and their compliance in regards to the Microsoft AntiMalware Service

.EXAMPLE
Get-DSCEAreport -ComputerName 'dc1'

Description
-----------
This command returns all configuration items for computer 'dc1'

.EXAMPLE
Get-DSCEAreport -Overall

Description
-----------
This command returns true/false per machine if they comply with the entire configuration file

.EXAMPLE
Get-DSCEAreport -Detailed

Description
-----------
This command returns non-compliant configuration file items detected, grouped by computer
#>
    [CmdLetBinding()]
    param
    (
        [parameter(Mandatory=$true,ParameterSetName='Item')]
        [String]$ItemName,

        [parameter(Mandatory=$true,ParameterSetName='Computer')]
        [String]$ComputerName,

        [parameter(Mandatory=$true,ParameterSetName='Overall')]
        [switch]$Overall,

        [parameter(Mandatory=$true,ParameterSetName='Detailed')]
        [switch]$Detailed,

        [String]$InFile = (Get-ChildItem .\results*.xml | Sort-Object -Property LastWriteTime -Descending | Select-Object -First 1).FullName,

        [String]$OutPath = '.'
    )
    $env:PSModulePath -split ';' | ForEach-Object {
        if(Test-Path (Join-Path -Path $_ -ChildPath 'DSCEA')) {
            if (!(Test-Path -Path 'C:\ProgramData\DSCEA')) {
                New-Item 'C:\ProgramData\DSCEA' -Type Directory
            }
            Copy-Item -Path (Get-ChildItem -Path $_ -Recurse -Filter 'logo.png').FullName -Destination 'C:\ProgramData\DSCEA\logo.png' -Force
        }
    }
    $results = Import-Clixml $InFile
    $date = (Get-ChildItem $InFile).LastWriteTime
    if($Overall){
        $results | 
        select-object -ExpandProperty Compliance | Where-Object {$_.PSComputerName -ne $null} |
        select-object @{Name="Computer";Expression={$_.PSComputerName}}, @{Name="Compliant";Expression={$_.InDesiredState}} |
        ConvertTo-HTML -Head $webstyle -body "<img src='C:\ProgramData\DSCEA\logo.png'/><br>","<titlesection>DSC Configuration Report</titlesection><br>","<datesection>Report last run on",$date,"</datesection><p>" | 
        Out-File (Join-Path -Path $OutPath -ChildPath 'OverallComplianceReport.html')
        Get-ItemProperty (Join-Path -Path $OutPath -ChildPath 'OverallComplianceReport.html')
    }
    if($Detailed){
        $results | ForEach-Object {
            $_.Compliance | ForEach-Object {
        $_.ResourcesNotInDesiredState | 
        Select-Object @{Name="Computer";Expression={$_.PSComputerName}}, ResourceName, InstanceName, InDesiredState
        }
    } | ConvertTo-HTML -Head $webstyle -body "<img src='C:\ProgramData\DSCEA\logo.png'/><br>","<titlesection>DSC Configuration Report</titlesection><br>","<datesection>Report last run on",$date,"</datesection><p>" | 
    Out-File (Join-Path -Path $OutPath -ChildPath 'DetailedComplianceReport.html')
    Get-ItemProperty (Join-Path -Path $OutPath -ChildPath 'DetailedComplianceReport.html')
    }
    if($ItemName){
        $results | ForEach-Object {
            $_.Compliance | ForEach-Object {
                $_.ResourcesInDesiredState | ForEach-Object {$_ | Select-Object @{Name="Computer";Expression={$_.PSComputerName}}, ResourceName, InstanceName, InDesiredState}
                $_.ResourcesNotInDesiredState | ForEach-Object {$_ | Select-Object @{Name="Computer";Expression={$_.PSComputerName}}, ResourceName, InstanceName, InDesiredState}
            }
        } | Where-object {$_.InstanceName -ieq $ItemName} | 
        ConvertTo-HTML -Head $webstyle -body "<img src='C:\ProgramData\DSCEA\logo.png'/><br>","<titlesection>DSC Configuration Report</titlesection><br>","<datesection>Report last run on",$date,"</datesection><p>" | 
        Out-File (Join-Path -Path $OutPath -ChildPath "ItemComplianceReport-$ItemName.html")
        Get-ItemProperty (Join-Path -Path $OutPath -ChildPath "ItemComplianceReport-$ItemName.html")
    }
    if($ComputerName){
        $results | where-object {$_.Computer -ieq $ComputerName} | ForEach-Object {
            $_.Compliance | ForEach-Object {
                $_.ResourcesNotInDesiredState | Select-Object @{Name="Computer";Expression={$_.PSComputerName}}, ResourceName, InstanceName, InDesiredState
                $_.ResourcesInDesiredState | Select-Object @{Name="Computer";Expression={$_.PSComputerName}}, ResourceName, InstanceName, InDesiredState
            }
        } | ConvertTo-HTML -Head $webstyle -body "<img src='C:\ProgramData\DSCEA\logo.png'/><br>","<titlesection>DSC Configuration Report</titlesection><br>","<datesection>Report last run on",$date,"</datesection><p>" | 
        Out-File (Join-Path -Path $OutPath -ChildPath "ComputerComplianceReport-$ComputerName.html")
        Get-ItemProperty (Join-Path -Path $OutPath -ChildPath "ComputerComplianceReport-$ComputerName.html")
    }
}
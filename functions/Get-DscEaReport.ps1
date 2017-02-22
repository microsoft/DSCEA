function Get-DscEaReport {
<#   
.SYNOPSIS   
Generate a report after Start-DscEaScan has been run

.DESCRIPTION 
Used to create viewable reports after Start-DscEaScan has created a results.xml file which will be parsed 

.PARAMETER ItemName
This is the item name from the configuration file, used to generate a report of every machine's compliance against that item

.PARAMETER ComputerName
The computer name here will cause the report to display all items (true/false) pertaining to ComputerName

.PARAMETER Overall
Switch parameter indicating that the report generated will display true/false per computer in regards to the entire configuration file

.PARAMETER Detailed
Switch parameter indicating that the report generated will display true/false per configuration file item, per computer

.LINK
http://aka.ms/dscea

.EXAMPLE
Get-DscEaReport -ItemName MicrosoftAntimalwareService

Description
-----------
This command returns all systems in computer.txt and if Microsoft AntiMalware Service is configured correctly

.EXAMPLE
Get-DscEaReport -ComputerName 'dc1'

Description
-----------
This command returns all configuration items for computer 'dc1'

.EXAMPLE
Get-DscEaReport -Overall

Description
-----------
This command returns true/false per machine if they comply with the entire configuration file

.EXAMPLE
Get-DscEaReport -Detailed

Description
-----------
This command returns true/false per configuration item, per machine
#>
    [CmdLetBinding()]
    param
    (
        [parameter(Mandatory = $true , ParameterSetName = 'Item')]
        [String]$ItemName,

        [parameter(Mandatory = $true , ParameterSetName = 'Computer')]
        [String]$ComputerName,

        [parameter(Mandatory=$true , ParameterSetName='Overall')]
        [switch]$Overall,

        [parameter(Mandatory = $true , ParameterSetName = 'Detailed')]
        [switch]$Detailed,

        [String]$InFile = (Get-ChildItem $location\Output\results*.xml | Sort-Object -Property LastWriteTime -Descending | Select -First 1).FullName,

        [String]$OutPath = "$env:ProgramFiles\DSC-EA\Output"
    )
    helper-EnsureLogo
    $results = Import-Clixml $InFile
    $date = (Get-ChildItem $InFile).LastWriteTime
    if($Overall){
        $results | 
        select-object -ExpandProperty Compliance | Where-Object {$_.PSComputerName -ne $null} |
        select @{Name="Computer";Expression={$_.PSComputerName}}, @{Name="Compliant";Expression={$_.InDesiredState}} |
        ConvertTo-HTML -Head $webstyle -body "<img src='logo.png'/><br>","<titlesection>DSC Configuration Report</titlesection><br>","<datesection>Report last run on",$date,"</datesection><p>" | 
        Out-File $env:ProgramFiles\DSC-EA\Output\OverallComplianceReport.html
        Write-Host "Report $OutPath\OverallComplianceReport.html generated"
    }
    if($Detailed){
        $results | % {
            $_.Compliance | % {
        $_.ResourcesNotInDesiredState | 
        Select-Object @{Name="Computer";Expression={$_.PSComputerName}}, ResourceName, InstanceName, InDesiredState
        }
    } | ConvertTo-HTML -Head $webstyle -body "<img src='logo.png'/><br>","<titlesection>DSC Configuration Report</titlesection><br>","<datesection>Report last run on",$date,"</datesection><p>" | 
    Out-File $env:ProgramFiles\DSC-EA\Output\DetailedComplianceReport.html 
    Write-Host "Report $OutPath\DetailedComplianceReport.html generated"
    }
    if($ItemName){
        $results | % {
            $_.Compliance | % {
                $_.ResourcesInDesiredState | % {$_ | Select-Object @{Name="Computer";Expression={$_.PSComputerName}}, ResourceName, InstanceName, InDesiredState}
                $_.ResourcesNotInDesiredState | % {$_ | Select-Object @{Name="Computer";Expression={$_.PSComputerName}}, ResourceName, InstanceName, InDesiredState}
            }
        } | Where-object {$_.InstanceName -ieq $ItemName} | 
        ConvertTo-HTML -Head $webstyle -body "<img src='logo.png'/><br>","<titlesection>DSC Configuration Report</titlesection><br>","<datesection>Report last run on",$date,"</datesection><p>" | 
        Out-File $OutPath\ItemComplianceReport-$ItemName.html
        Write-Host "Report $OutPath\ItemComplianceReport-$ItemName.html generated"
    }
    if($ComputerName){
        $results | where-object {$_.Computer -ieq $ComputerName} | % {
            $_.Compliance | % {
                $_.ResourcesNotInDesiredState | Select-Object @{Name="Computer";Expression={$_.PSComputerName}}, ResourceName, InstanceName, InDesiredState
                $_.ResourcesInDesiredState | Select-Object @{Name="Computer";Expression={$_.PSComputerName}}, ResourceName, InstanceName, InDesiredState
            }
        } | ConvertTo-HTML -Head $webstyle -body "<img src='logo.png'/><br>","<titlesection>DSC Configuration Report</titlesection><br>","<datesection>Report last run on",$date,"</datesection><p>" | Out-File $OutPath\ComputerComplianceReport-$ComputerName.html 
        Write-Host "Report $OutPath\ComputerComplianceReport-$ComputerName.html generated"
    }
}
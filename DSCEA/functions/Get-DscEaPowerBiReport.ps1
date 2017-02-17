function Get-DscEaPowerBiReport {
    [CmdLetBinding()]
    param
    (
    [String]$OutPath = "$env:ProgramFiles\DSC-EA\Output",
    
    [String]$ExceptionsFile = $null
    )
    Set-Location $OutPath
  
    (Get-ChildItem -Path $OutPath -Filter '*.xml' | Sort-Object LastWriteTime -Descending)[0] | ForEach-Object {
        $results = Import-CliXml $_
        $newdata = $results | ForEach-Object {
            $_.Compliance | ForEach-Object {
                if($_.ResourcesInDesiredState) {
                    $_.ResourcesInDesiredState | ForEach-Object {
                        $_
                    }
                }
                if($_.ResourcesNotInDesiredState) {
                    $_.ResourcesNotInDesiredState | ForEach-Object {
                        $_
                    }
                }
            }
        }
    }
    $parsedData = $newdata | Select-Object PSComputerName, ResourceName, InstanceName, InDesiredState, ConfigurationName, StartDate
    if(Test-Path .\DAY.CSV) {
        if(Test-Path .\ALL.CSV) {
            if((Get-ChildItem -Path .\ALL.CSV).LastWriteTime -lt (Get-Date).AddDays(-1)) {
                Import-Csv -Path .\DAY.CSV | Export-Csv -Path .\ALL.CSV -Append
                $parsedData | Export-Csv -Path $OutPath\DAY.CSV -NoTypeInformation
            }
            else {
                $parsedData | Export-Csv -Path $OutPath\DAY.CSV -NoTypeInformation
            }
        } else {
            Rename-Item -Path .\DAY.CSV -NewName .\ALL.CSV
            $parsedData | Export-Csv -Path $OutPath\DAY.CSV -NoTypeInformation
        }       
    }
    else {
        $parsedData | Export-Csv -Path $OutPath\DAY.CSV -NoTypeInformation
    }
    if($ExceptionsFile){
    Invoke-Expression -Command $ExceptionsFile
        }
}
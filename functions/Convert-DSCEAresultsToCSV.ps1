function Convert-DSCEAresultsToCSV {
    [CmdLetBinding()]
    param
    (
    [String]$InputXML = '.',
    [String]$OutFile = '.\output.csv',
    [String]$ExceptionsFile = $null
    )

    (Get-ChildItem -Path $InputXML -Filter '*.xml' | Sort-Object LastWriteTime -Descending)[0] | ForEach-Object {
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
    $parsedData | Export-Csv -Path $OutFile -NoTypeInformation
    return Get-ItemProperty $OutFile
}
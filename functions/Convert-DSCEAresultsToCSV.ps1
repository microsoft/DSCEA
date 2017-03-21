function Convert-DSCEAresultsToCSV {
<#   
.SYNOPSIS   
Creates CSV data file from DSCEA results

.DESCRIPTION 
Used to convert the raw XML output from a DSCEA scan to a more consumable format of CSV

.PARAMETER InputXML
The file name (full file path) of the XML file you would like to convert to CSV.  If one is not provided, Convert-DSCEAresultsToCSV looks to the current directory for the most recently created XML file.

.PARAMETER OutFile
The new file name (full file path) of the output CSV file.  If one is not provided, Convert-DSCEAresultsToCSV will create output.csv in the current directory.

.LINK
https://microsoft.github.io/DSCEA

.EXAMPLE
Convert-DSCEAresultsToCSV

Description
-----------
Looks in the current directory for the most recently created XML file, parses the file and converts it to a CSV file in the same directory

.EXAMPLE
Convert-DSCEAresultsToCSV -InputXML C:\Users\username\Documents\DSCEA\results.20170311-2307-31.xml

Description
-----------
Converts C:\Users\username\Documents\DSCEA\results.20170311-2307-31.xml to a CSV file, saved in the current directory

.EXAMPLE
Convert-DSCEAresultsToCSV -InputXML C:\Users\username\Documents\DSCEA\results.20170311-2307-31.xml -OutFile C:\Users\username\Documents\DSCEA\output.csv

Description
-----------
Converts C:\Users\username\Documents\DSCEA\results.20170311-2307-31.xml to a CSV file saved at C:\Users\username\Documents\DSCEA\output.csv
#>
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
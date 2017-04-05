---
title: DSCEA Functions Reference
sidebar: mydoc_sidebar
permalink: mydoc_functions_reference.html
folder: mydoc
---

<p id="FunctionsTop"><a href="#StartDSCEAscan">Start-DSCEAscan</a></p>
<p><a href="#GetDSCEAreport">Get-DSCEAreport</a></p>
<p><a href="#ConvertDSCEAresultsToCSV">Convert-DSCEAresultsToCSV</a></p>
<p><a href="#SendDSCEACSVtoSQL">Send-DSCEACSVtoSQL</a></p>

<h2 id="StartDSCEAscan"><strong>Start-DSCEAscan</strong></h2>
    
## SYNOPSIS
Will run Test-DscConfiguration -ReferenceConfiguration using the provided MOF file against the remote systems supplied and saves the scan results to a XML file

## SYNTAX

### ComputerName
```
Start-DSCEAscan [-OutputPath <String>] [-LogsPath <String>] [-MofFile <String>] [-JobTimeout <String>]
 [-ScanTimeout <String>] [-Force] [-ResultsFile <String>] -ComputerName <String[]>
```

### InputFile
```
Start-DSCEAscan [-OutputPath <String>] [-LogsPath <String>] [-MofFile <String>] -InputFile <String>
 [-JobTimeout <String>] [-ScanTimeout <String>] [-Force] [-ResultsFile <String>]
```

### CimSession
```
Start-DSCEAscan [-OutputPath <String>] [-LogsPath <String>] [-MofFile <String>] [-JobTimeout <String>]
 [-ScanTimeout <String>] [-Force] [-ResultsFile <String>] -CimSession <CimSession[]>
```

### Path
```
Start-DSCEAscan [-OutputPath <String>] [-LogsPath <String>] [-MofFile <String>] -Path <String>
 [-JobTimeout <String>] [-ScanTimeout <String>] [-Force] [-ResultsFile <String>]
```

## DESCRIPTION
Run this function after you have defined the remote systems to scan and have created a MOF file that defines the settings you want to check against

## PARAMETERS

### -OutputPath
The full file path for the DSCEA scan results XML file. 
The defined path must already exist.
If no value is provided, the result XML file will be saved to the current directory.

```
Type: String
Parameter Sets: (All)
Aliases: 

Required: False
Position: Named
Default value: .
Accept pipeline input: False
Accept wildcard characters: False
```

### -LogsPath
The full file path for the any DSCEA scan log files. 
The defined path must already exist.
If no value is provided, log files will be saved to the current directory.

```
Type: String
Parameter Sets: (All)
Aliases: 

Required: False
Position: Named
Default value: .
Accept pipeline input: False
Accept wildcard characters: False
```

### -MofFile
The file name (full file path) to the MOF file you are looking to use with DSCEA to perform a scan. 
If no value is provided, Start-DSCEAscan will look into the current directory for a file named localhost.mof

```
Type: String
Parameter Sets: (All)
Aliases: 

Required: False
Position: Named
Default value: Localhost.mof
Accept pipeline input: False
Accept wildcard characters: False
```

### -InputFile
The file name (full file path) to a text file that contains a list of computers you want to scan

```
Type: String
Parameter Sets: InputFile
Aliases: 

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -JobTimeout
Individual system timeout (seconds) If no value is provided, the default value of 600 seconds will be used.

```
Type: String
Parameter Sets: (All)
Aliases: 

Required: False
Position: Named
Default value: 600
Accept pipeline input: False
Accept wildcard characters: False
```

### -ScanTimeout
Total DSCEA scan timeout (seconds)  If no value is provided, the default value of 3600 seconds will be used.

```
Type: String
Parameter Sets: (All)
Aliases: 

Required: False
Position: Named
Default value: 3600
Accept pipeline input: False
Accept wildcard characters: False
```

### -Force
The force parameter attempts to close any running DSC related processes on systems being scanned before a scan begins to avoid LCM conflicts. 
Force is not enabled by default.

```
Type: SwitchParameter
Parameter Sets: (All)
Aliases: 

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -ResultsFile
The file name for the DSCEA scan results XML file. 
If no value is provided, a time based file name will be auto-generated.

```
Type: String
Parameter Sets: (All)
Aliases: 

Required: False
Position: Named
Default value: "results.$(Get-Date -Format 'yyyyMMdd-HHmm-ss').xml"
Accept pipeline input: False
Accept wildcard characters: False
```

### -ComputerName
Comma seperated list of computer names that you want to scan

```
Type: String[]
Parameter Sets: ComputerName
Aliases: 

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -CimSession
Provide DSCEA with a CimSession object to perform compliance scans against remote systems that are either not members of the same domain as the management system, are workgroup systems or require other credentials

```
Type: CimSession[]
Parameter Sets: CimSession
Aliases: 

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Path
Provide DSCEA with a folder path containing machine specific MOF files to allow for a scan of those systems against unique per system settings

```
Type: String
Parameter Sets: Path
Aliases: 

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

## EXAMPLES

### -------------------------- EXAMPLE 1 --------------------------
```
Start-DSCEAscan -MofFile .\localhost.mof -ComputerName dsctest-1, dsctest-2, dsctest-3
```

Description
-----------
This command executes a DSCEA scan against 3 remote systems, dsctest-1, dsctest-2 and dsctest-3 using a locally defined MOF file that exists in the current directory.
This MOF file specifies the settings to check for during the scan.
Start-DSCEAscan returns a XML results file containing raw data that can be used with other functions, such as Get-DSCEAreport to create reports with consumable information.

### -------------------------- EXAMPLE 2 --------------------------
```
Start-DSCEAscan -MofFile C:\Users\username\Documents\DSCEA\localhost.mof -ComputerName dsctest-1, dsctest-2, dsctest-3
```

Description
-----------
This command executes a DSCEA scan against 3 remote systems, dsctest-1, dsctest-2 and dsctest-3 using a locally defined MOF file that exists at "C:\Users\username\Documents\DSCEA".
This MOF file specifies the settings to check for during the scan.
Start-DSCEAscan returns a XML results file containing raw data that can be used with other functions, such as Get-DSCEAreport to create reports with consumable information.

### -------------------------- EXAMPLE 3 --------------------------
```
Start-DSCEAscan -MofFile .\localhost.mof -InputFile C:\Users\username\Documents\DSCEA\computers.txt
```

Description
-----------
This command executes a DSCEA scan against the systems listed within "C:\Users\username\Documents\DSCEA\computers.txt" using a locally defined MOF file that exists in the current directory.
This MOF file specifies the settings to check for during the scan.
Start-DSCEAscan returns a XML results file containing raw data that can be used with other functions, such as Get-DSCEAreport to create reports with consumable information.

### -------------------------- EXAMPLE 4 --------------------------
```
Start-DSCEAscan -MofFile C:\Users\username\Documents\DSCEA\localhost.mof -InputFile C:\Users\username\Documents\DSCEA\computers.txt
```

Description
-----------
This command executes a DSCEA scan against the systems listed within "C:\Users\username\Documents\DSCEA\computers.txt" using a locally defined MOF file that exists at "C:\Users\username\Documents\DSCEA".
This MOF file specifies the settings to check for during the scan.
Start-DSCEAscan returns a XML results file containing raw data that can be used with other functions, such as Get-DSCEAreport to create reports with consumable information.

### -------------------------- EXAMPLE 5 --------------------------
```
Start-DSCEAscan -MofFile C:\Users\username\Documents\DSCEA\localhost.mof -ComputerName dsctest-1, dsctest-2, dsctest-3 -OutputPath C:\Temp\DSCEA\Output -ResultsFile "results.xml" -LogsPath C:\Temp\DSCEA\Logs -JobTimeout 10 -ScanTimeout 60 -Force -Verbose
```

Description
-----------
This command executes a DSCEA scan against 3 remote systems, dsctest-1, dsctest-2 and dsctest-3 using a locally defined MOF file that exists at "C:\Users\username\Documents\DSCEA".
This MOF file specifies the settings to check for during the scan.
Start-DSCEAscan returns a XML results file containing raw data that can be used with other functions, such as Get-DSCEAreport to create reports with consumable information.
This example specifies custom values for -OutputPath and -LogsPath, which must be directories that are pre-existing to store results and logs from the scan.
This scan also specifies custom values for -ResultsFile to provide the file name of the scan results file, -JobTimeout and -ScanTimeout which provide new timeout values for individual system timeouts and the overall scan timeout, a -Force option which attempts to close any running DSC related processes on systems being scanned before a scan begins to avoid LCM conflicts and -Verbose, which will provide full verbose output of the scan process.

### -------------------------- EXAMPLE 6 --------------------------
```
$UserName = 'LocalUser'
$Password = ConvertTo-SecureString -String "P@ssw0rd" -AsPlainText -Force
$Servers = "dsctest-4,dsctest-5,dsctest-6"
$Cred =  New-Object System.Management.Automation.PsCredential -ArgumentList $UserName, $Password
$Sessions = New-CimSession -Authentication Negotiate -ComputerName $Servers -Credential $Cred
Start-DscEaScan -CimSession $Sessions -MofFile C:\Users\username\Documents\DSCEA\localhost.mof -Verbose
```

Description
-----------
This command utilizes New-CimSession and executes a DSCEA scan against 3 remote non-domain systems, dsctest-4, dsctest-5 and dsctest-6 using a locally defined MOF file that exists at "C:\Users\username\Documents\DSCEA".
This MOF file specifies the settings to check for during the scan.
Start-DSCEAscan returns a XML results file containing raw data that can be used with other functions, such as Get-DSCEAreport to create reports with consumable information.

### -------------------------- EXAMPLE 7 --------------------------
```
Start-DSCEAscan -Path 'C:\Users\username\Documents\DSCEA\MOFFiles'
```

Description
-----------
This command executes a DSCEA scan against the systems supplied as machine specific MOF files stored inside 'C:\Users\username\Documents\DSCEA\MOFFiles'. Start-DSCEAscan returns a XML results file containing raw data that can be used with other functions, such as Get-DSCEAreport to create reports with consumable information.

<h2 id="GetDSCEAreport"><strong>Get-DSCEAreport</strong></h2>
<p><a href="#FunctionsTop">Go back to the top</a></p>

## SYNOPSIS
Generates a HTML based report after Start-DSCEAscan has been run

## SYNTAX

### Overall
```
Get-DSCEAreport [-Overall] [-InFile <String>] [-OutPath <String>]
```

### Detailed
```
Get-DSCEAreport [-Detailed] [-InFile <String>] [-OutPath <String>]
```

### ItemName
```
Get-DSCEAreport -ItemName <String> [-InFile <String>] [-OutPath <String>]
```

### ComputerName
```
Get-DSCEAreport -ComputerName <String> [-InFile <String>] [-OutPath <String>]
```

## DESCRIPTION
Used to create viewable reports after Start-DSCEAscan has created a results.xml file which will be parsed.

## PARAMETERS

### -ItemName
Switch parameter - This is the item name from the configuration file, used to generate a report of every machine's compliance against that item

```
Type: String
Parameter Sets: ItemName
Aliases: 

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ComputerName
Switch parameter - Supplying a computer name will cause the report to display all items (true/false) pertaining to ComputerName

```
Type: String
Parameter Sets: ComputerName
Aliases: 

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Overall
Switch parameter - Indicating that the report generated will display all up true/false per computer in regards to compliance against the entire configuration file

```
Type: SwitchParameter
Parameter Sets: Overall
Aliases: 

Required: True
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -Detailed
Switch parameter - Indicating that the report generated will display all non-compliant configuration file items detected, grouped by computer

```
Type: SwitchParameter
Parameter Sets: Detailed
Aliases: 

Required: True
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -InFile
The file name (full file path) of the XML file you would like to convert. 
If one is not provided, Get-DSCEAreport looks to the current directory for the most recently created XML file.

```
Type: String
Parameter Sets: (All)
Aliases: 

Required: False
Position: Named
Default value: (Get-ChildItem .\results*.xml | Sort-Object -Property LastWriteTime -Descending | Select-Object -First 1).FullName
Accept pipeline input: False
Accept wildcard characters: False
```

### -OutPath
The full file path to use as a location to store HTML reports. 
The file path must be a pre-existing folder. 
If one is not provided, Get-DSCEAreport will create the HTML file in the current directory.

```
Type: String
Parameter Sets: (All)
Aliases: 

Required: False
Position: Named
Default value: .
Accept pipeline input: False
Accept wildcard characters: False
```

## EXAMPLES

### -------------------------- EXAMPLE 1 --------------------------
```
Get-DSCEAreport -Overall
```

Description
-----------
This command returns true/false per machine regarding whether they comply with the entire configuration file

### -------------------------- EXAMPLE 2 --------------------------
```
Get-DSCEAreport -Detailed
```

Description
-----------
This command returns non-compliant configuration file items detected, grouped by computer

### -------------------------- EXAMPLE 3 --------------------------
```
Get-DSCEAreport -ItemName MicrosoftAntimalwareService
```

Description
-----------
This command returns all systems that were scanned and their compliance in regards to the Microsoft AntiMalware Service

### -------------------------- EXAMPLE 4 --------------------------
```
Get-DSCEAreport -ComputerName 'dc1'
```

Description
-----------
This command returns all configuration items for computer 'dc1'

<h2 id="ConvertDSCEAresultsToCSV"><strong>Convert-DSCEAresultsToCSV</strong></h2>
<p><a href="#FunctionsTop">Go back to the top</a></p>

## SYNOPSIS
Creates CSV data file from DSCEA results

## SYNTAX

```
Convert-DSCEAresultsToCSV [[-InputXML] <String>] [[-OutFile] <String>] [[-ExceptionsFile] <String>]
```

## DESCRIPTION
Used to convert the raw XML output from a DSCEA scan to a more consumable format of CSV

## PARAMETERS

### -InputXML
The file name (full file path) of the XML file you would like to convert to CSV. 
If one is not provided, Convert-DSCEAresultsToCSV looks to the current directory for the most recently created XML file.

```
Type: String
Parameter Sets: (All)
Aliases: 

Required: False
Position: 1
Default value: .
Accept pipeline input: False
Accept wildcard characters: False
```

### -OutFile
The new file name (full file path) of the output CSV file. 
The file path must include a pre-existing folder. 
If one is not provided, Convert-DSCEAresultsToCSV will create output.csv in the current directory.

```
Type: String
Parameter Sets: (All)
Aliases: 

Required: False
Position: 2
Default value: .\output.csv
Accept pipeline input: False
Accept wildcard characters: False
```

### -ExceptionsFile
{{Fill ExceptionsFile Description}}

```
Type: String
Parameter Sets: (All)
Aliases: 

Required: False
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

## EXAMPLES

### -------------------------- EXAMPLE 1 --------------------------
```
Convert-DSCEAresultsToCSV
```

Description
-----------
Looks in the current directory for the most recently created XML file, parses the file and converts it to a CSV file in the same directory

### -------------------------- EXAMPLE 2 --------------------------
```
Convert-DSCEAresultsToCSV -InputXML C:\Users\username\Documents\DSCEA\results.20170311-2307-31.xml
```

Description
-----------
Converts C:\Users\username\Documents\DSCEA\results.20170311-2307-31.xml to a CSV file, saved in the current directory

### -------------------------- EXAMPLE 3 --------------------------
```
Convert-DSCEAresultsToCSV -InputXML C:\Users\username\Documents\DSCEA\results.20170311-2307-31.xml -OutFile C:\Users\username\Documents\DSCEA\output.csv
```

Description
-----------
Converts C:\Users\username\Documents\DSCEA\results.20170311-2307-31.xml to a CSV file saved at C:\Users\username\Documents\DSCEA\output.csv

<h2 id="SendDSCEACSVtoSQL"><strong>Send-DSCEACSVtoSQL</strong></h2>
<p><a href="#FunctionsTop">Go back to the top</a></p>

The Send-DSCEACSVtoSQL function is reserved for future use.
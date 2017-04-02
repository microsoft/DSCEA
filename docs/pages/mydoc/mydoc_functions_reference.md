---
title: DSCEA Functions Reference
sidebar: mydoc_sidebar
permalink: mydoc_functions_reference.html
folder: mydoc
---

<h2 id="Top">DSCEA Functions Reference</h2>

<p><a href="#StartDSCEAscan">Start-DSCEAscan</a></p>
<p><a href="#GetDSCEAreport">Get-DSCEAreport</a></p>
<p><a href="#ConvertDSCEAresultsToCSV">Convert-DSCEAresultsToCSV</a></p>
<p><a href="#SendDSCEACSVtoSQL">Send-DSCEACSVtoSQL</a></p>

<h3 id="StartDSCEAscan"><strong>Start-DSCEAscan</strong></h3>
<p><a href="#Top">Go back to the top</a></p>
    
**SYNOPSIS**

Will run Test-DscConfiguration -ReferenceConfiguration using the provided MOF file against the remote systems supplied and saves the scan results to a XML file
    
**SYNTAX**

    Start-DSCEAscan [-OutputPath <String>] [-LogsPath <String>] [-MofFile <String>] -InputFile <String> [-JobTimeout <String>] [-ScanTimeout <String>] [-Force] [-ResultsFile <String>] [<CommonParameters>]
    
    Start-DSCEAscan [-OutputPath <String>] [-LogsPath <String>] [-MofFile <String>] [-JobTimeout <String>] [-ScanTimeout <String>] [-Force] [-ResultsFile <String>] -ComputerName <String[]> [<CommonParameters>]
    
    Start-DSCEAscan [-OutputPath <String>] [-LogsPath <String>] [-MofFile <String>] [-JobTimeout <String>] [-ScanTimeout <String>] [-Force] [-ResultsFile <String>] -CimSession <CimSession[]> [<CommonParameters>]
        
**DESCRIPTION**

Run this function after you have defined the remote systems to scan and have created a MOF file that defines the settings you want to check against
    
**PARAMETERS**

    -OutputPath <String>
        The full file path for the DSCEA scan results XML file.  The defined path must already exist. If no value is provided, the result XML file will be saved to the current directory.
        
        Required?                    false
        Position?                    named
        Default value                .
        Accept pipeline input?       false
        Accept wildcard characters?  false
        
    -LogsPath <String>
        The full file path for the any DSCEA scan log files.  The defined path must already exist. If no value is provided, log files will be saved to the current directory.
        
        Required?                    false
        Position?                    named
        Default value                .
        Accept pipeline input?       false
        Accept wildcard characters?  false
        
    -MofFile <String>
        The file name (full file path) to the MOF file you are looking to use with DSCEA to perform a scan.  If no value is provided, Start-DSCEAscan will look into the current directory for a file named localhost.mof
        
        Required?                    false
        Position?                    named
        Default value                localhost.mof
        Accept pipeline input?       false
        Accept wildcard characters?  false
        
    -InputFile <String>
        The file name (full file path) to a text file that contains a list of computers you want to scan.  Either use the ComputerName paramter or InputFile, DSCEA does not currently support using both.
        
        Required?                    true
        Position?                    named
        Default value                
        Accept pipeline input?       false
        Accept wildcard characters?  false
        
    -JobTimeout <String>
        Individual system timeout (seconds) If no value is provided, the default value of 600 seconds will be used.
        
        Required?                    false
        Position?                    named
        Default value                600
        Accept pipeline input?       false
        Accept wildcard characters?  false
        
    -ScanTimeout <String>
        Total DSCEA scan timeout (seconds)  If no value is provided, the default value of 3600 seconds will be used.
        
        Required?                    false
        Position?                    named
        Default value                3600
        Accept pipeline input?       false
        Accept wildcard characters?  false
        
    -Force [<SwitchParameter>]
        The force parameter attempts to close any running DSC related processes on systems being scanned before a scan begins to avoid LCM conflicts.  Force is not enabled by default.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Accept wildcard characters?  false
        
    -ResultsFile <String>
        The file name for the DSCEA scan results XML file.  If no value is provided, a time based file name will be auto-generated.
        
        Required?                    false
        Position?                    named
        Default value                "results.$(Get-Date -Format 'yyyyMMdd-HHmm-ss').xml"
        Accept pipeline input?       false
        Accept wildcard characters?  false
        
    -ComputerName <String[]>
        Comma seperated list of computer names that you want to scan
        
        Required?                    true
        Position?                    named
        Default value                
        Accept pipeline input?       false
        Accept wildcard characters?  false
        
    -CimSession <CimSession[]>
        Provide DSCEA with a CimSession object to perform compliance scans against remote systems that are either not members of the same domain as the management system, are workgroup systems or require other credentials
        
        Required?                    true
        Position?                    named
        Default value                
        Accept pipeline input?       false
        Accept wildcard characters?  false
        
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug, ErrorAction, ErrorVariable, WarningAction, WarningVariable, OutBuffer, PipelineVariable, and OutVariable. For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216). 
    
 **EXAMPLES**

    -------------------------- EXAMPLE 1 --------------------------
    
    PS C:\>Start-DSCEAscan -MofFile .\localhost.mof -ComputerName dsctest-1, dsctest-2, dsctest-3
    
    Description
    -----------
    This command executes a DSCEA scan against 3 remote systems, dsctest-1, dsctest-2 and dsctest-3 using a locally defined MOF file that exists in the current directory. This MOF file specifies the settings to check for during the scan. Start-DSCEAscan returns a XML results file containing raw data that can be used with other functions, such as Get-DSCEAreport to create reports with consumable information.
    
    
    -------------------------- EXAMPLE 2 --------------------------
    
    PS C:\>Start-DSCEAscan -MofFile C:\Users\username\Documents\DSCEA\localhost.mof -ComputerName dsctest-1, dsctest-2, dsctest-3
    
    Description
    -----------
    This command executes a DSCEA scan against 3 remote systems, dsctest-1, dsctest-2 and dsctest-3 using a locally defined MOF file that exists at "C:\Users\username\Documents\DSCEA". This MOF file specifies the settings to check for during the scan. Start-DSCEAscan returns a XML results file containing raw data that can be used with other functions, such as Get-DSCEAreport to create reports with consumable information.
    
    
    -------------------------- EXAMPLE 3 --------------------------
    
    PS C:\>Start-DSCEAscan -MofFile .\localhost.mof -InputFile C:\Users\username\Documents\DSCEA\computers.txt
    
    Description
    -----------
    This command executes a DSCEA scan against the systems listed within "C:\Users\username\Documents\DSCEA\computers.txt" using a locally defined MOF file that exists in the current directory. This MOF file specifies the settings to check for during the scan. Start-DSCEAscan returns a XML results file containing raw data that can be used with other functions, such as Get-DSCEAreport to create reports with consumable information.
    
    
    -------------------------- EXAMPLE 4 --------------------------
    
    PS C:\>Start-DSCEAscan -MofFile C:\Users\username\Documents\DSCEA\localhost.mof -InputFile C:\Users\username\Documents\DSCEA\computers.txt
    
    Description
    -----------
    This command executes a DSCEA scan against the systems listed within "C:\Users\username\Documents\DSCEA\computers.txt" using a locally defined MOF file that exists at "C:\Users\username\Documents\DSCEA". This MOF file specifies the settings to check for during the scan. Start-DSCEAscan returns a XML results file containing raw data that can be used with other functions, such as Get-DSCEAreport to create reports with consumable information.
    
    
    -------------------------- EXAMPLE 5 --------------------------
    
    PS C:\>Start-DSCEAscan -MofFile C:\Users\username\Documents\DSCEA\localhost.mof -ComputerName dsctest-1, dsctest-2, dsctest-3 -OutputPath C:\Temp\DSCEA\Output -ResultsFile "results.xml" -LogsPath C:\Temp\DSCEA\Logs -JobTimeout 10 -ScanTimeout 60 -Force -Verbose
    
    Description
    -----------
    This command executes a DSCEA scan against 3 remote systems, dsctest-1, dsctest-2 and dsctest-3 using a locally defined MOF file that exists at "C:\Users\username\Documents\DSCEA". This MOF file specifies the settings to check for during the scan. Start-DSCEAscan returns a XML results file containing raw data that can be used with other functions, such as Get-DSCEAreport to create reports with consumable information.
    
    This example specifies custom values for -OutputPath and -LogsPath, which must be directories that are pre-existing to store results and logs from the scan. This scan also specifies custom values for -ResultsFile to provide the file name of the scan results file, -JobTimeout and -ScanTimeout which provide new timeout values for individual system timeouts and the overall scan timeout, a -Force option which attempts to close any running DSC related processes on systems being scanned before a scan begins to avoid LCM conflicts and -Verbose, which will provide full verbose output of the scan process.
    
    
    -------------------------- EXAMPLE 6 --------------------------
    
    PS C:\>$UserName = 'LocalUser'
    
    $Password = ConvertTo-SecureString -String "P@ssw0rd" -AsPlainText -Force
    $Servers = "dsctest-4,dsctest-5,dsctest-6"
    $Cred =  New-Object System.Management.Automation.PsCredential -ArgumentList $UserName, $Password
    $Sessions = New-CimSession -Authentication Negotiate -ComputerName $Servers -Credential $Cred
    Start-DscEaScan -CimSession $Sessions -MofFile C:\Users\username\Documents\DSCEA\localhost.mof -Verbose
    
    Description
    -----------
    This command utilizes New-CimSession and executes a DSCEA scan against 3 remote non-domain systems, dsctest-4, dsctest-5 and dsctest-6 using a locally defined MOF file that exists at "C:\Users\username\Documents\DSCEA". This MOF file specifies the settings to check for during the scan. Start-DSCEAscan returns a XML results file containing raw data that can be used with other functions, such as Get-DSCEAreport to create reports with consumable information.


<h3 id="GetDSCEAreport"><strong>Get-DSCEAreport</strong></h3>
<p><a href="#Top">Go back to the top</a></p>

**SYNOPSIS**

Generates a HTML based report after Start-DSCEAscan has been run
    
**SYNTAX**

    Get-DSCEAreport -ItemName <String> [-InFile <String>] [-OutPath <String>] [<CommonParameters>]
    
    Get-DSCEAreport -ComputerName <String> [-InFile <String>] [-OutPath <String>] [<CommonParameters>]
    
    Get-DSCEAreport -Overall [-InFile <String>] [-OutPath <String>] [<CommonParameters>]
    
    Get-DSCEAreport -Detailed [-InFile <String>] [-OutPath <String>] [<CommonParameters>]
    
**DESCRIPTION**

Used to create viewable reports after Start-DSCEAscan has created a results.xml file which will be parsed.
    
**PARAMETERS**

    -ItemName <String>
        Switch parameter - This is the item name from the configuration file, used to generate a report of every machine's compliance against that item
        
        Required?                    true
        Position?                    named
        Default value                
        Accept pipeline input?       false
        Accept wildcard characters?  false
        
    -ComputerName <String>
        Switch parameter - Supplying a computer name will cause the report to display all items (true/false) pertaining to ComputerName
        
        Required?                    true
        Position?                    named
        Default value                
        Accept pipeline input?       false
        Accept wildcard characters?  false
        
    -Overall [<SwitchParameter>]
        Switch parameter - Indicating that the report generated will display all up true/false per computer in regards to compliance against the entire configuration file
        
        Required?                    true
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Accept wildcard characters?  false
        
    -Detailed [<SwitchParameter>]
        Switch parameter - Indicating that the report generated will display all non-compliant configuration file items detected, grouped by computer
        
        Required?                    true
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Accept wildcard characters?  false
        
    -InFile <String>
        The file name (full file path) of the XML file you would like to convert.  If one is not provided, Get-DSCEAreport looks to the current directory for the most recently created XML file.
        
        Required?                    false
        Position?                    named
        Default value                (Get-ChildItem .\results*.xml | Sort-Object -Property LastWriteTime -Descending |                                  Select-Object -First 1).FullName
        Accept pipeline input?       false
        Accept wildcard characters?  false
        
    -OutPath <String>
        The full file path to use as a location to store HTML reports.  The file path must be a pre-existing folder.  If one is not provided, Get-DSCEAreport will create the HTML file in the current directory.
        
        Required?                    false
        Position?                    named
        Default value                .
        Accept pipeline input?       false
        Accept wildcard characters?  false
        
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug, ErrorAction, ErrorVariable, WarningAction, WarningVariable, OutBuffer, PipelineVariable, and OutVariable. For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216). 

**EXAMPLES**

    -------------------------- EXAMPLE 1 --------------------------
    
    PS C:\>Get-DSCEAreport -ItemName MicrosoftAntimalwareService
    
    Description
    -----------
    This command returns all systems that were scanned and their compliance in regards to the Microsoft AntiMalware Service


    -------------------------- EXAMPLE 2 --------------------------
    
    PS C:\>Get-DSCEAreport -ComputerName 'dc1'
    
    Description
    -----------
    This command returns all configuration items for computer 'dc1'


    -------------------------- EXAMPLE 3 --------------------------
    
    PS C:\>Get-DSCEAreport -Overall
    
    Description
    -----------
    This command returns true/false per machine regarding whether they comply with the entire configuration file
    
     
    -------------------------- EXAMPLE 4 --------------------------
    
    PS C:\>Get-DSCEAreport -Detailed
    
    Description
    -----------
    This command returns non-compliant configuration file items detected, grouped by computer
    

<h3 id="ConvertDSCEAresultsToCSV"><strong>Convert-DSCEAresultsToCSV</strong></h3>
<p><a href="#Top">Go back to the top</a></p>

**SYNOPSIS**

Creates CSV data file from DSCEA results
    
**SYNTAX**

    Convert-DSCEAresultsToCSV [[-InputXML] <String>] [[-OutFile] <String>] [[-ExceptionsFile] <String>] [<CommonParameters>]
    
**DESCRIPTION**

Used to convert the raw XML output from a DSCEA scan to a more consumable format of CSV
    
**PARAMETERS**

    -InputXML <String>
        The file name (full file path) of the XML file you would like to convert to CSV.  If one is not provided, Convert-DSCEAresultsToCSV looks to the current directory for the most recently created XML file.
        
        Required?                    false
        Position?                    1
        Default value                .
        Accept pipeline input?       false
        Accept wildcard characters?  false
        
    -OutFile <String>
        The new file name (full file path) of the output CSV file.  The file path must include a pre-existing folder.  If one is not provided, Convert-DSCEAresultsToCSV will create output.csv in the current directory.
        
        Required?                    false
        Position?                    2
        Default value                .\output.csv
        Accept pipeline input?       false
        Accept wildcard characters?  false
        
    -ExceptionsFile <String>
        
        Required?                    false
        Position?                    3
        Default value                
        Accept pipeline input?       false
        Accept wildcard characters?  false
        
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug, ErrorAction, ErrorVariable, WarningAction, WarningVariable,OutBuffer, PipelineVariable, and OutVariable. For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216). 
    
**EXAMPLES**

    -------------------------- EXAMPLE 1 --------------------------
    
    PS C:\>Convert-DSCEAresultsToCSV
    
    Description
    -----------
    Looks in the current directory for the most recently created XML file, parses the file and converts it to a CSV file in the same directory
    
    
    -------------------------- EXAMPLE 2 --------------------------
    
    PS C:\>Convert-DSCEAresultsToCSV -InputXML C:\Users\username\Documents\DSCEA\results.20170311-2307-31.xml
    
    Description
    -----------
    Converts C:\Users\username\Documents\DSCEA\results.20170311-2307-31.xml to a CSV file, saved in the current directory
    
    
    -------------------------- EXAMPLE 3 --------------------------
    
    PS C:\>Convert-DSCEAresultsToCSV -InputXML C:\Users\username\Documents\DSCEA\results.20170311-2307-31.xml -OutFile C:\Users\username\Documents\DSCEA\output.csv
    
    Description
    -----------
    Converts C:\Users\username\Documents\DSCEA\results.20170311-2307-31.xml to a CSV file saved at C:\Users\username\Documents\DSCEA\output.csv
    

<h3 id="SendDSCEACSVtoSQL"><strong>Send-DSCEACSVtoSQL</strong></h3>
<p><a href="#Top">Go back to the top</a></p>

The Send-DSCEACSVtoSQL function is reserved for future use.
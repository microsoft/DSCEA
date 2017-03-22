---
title: Introduction
keywords: DSCEA homepage
sidebar: mydoc_sidebar
permalink: index.html
---

## Overview

**DSC Environment Analyzer (DSCEA)** is a simple implementation of PowerShell Desired State Configuration that uses the declarative nature of DSC to scan Windows OS based systems in an environment against a defined reference MOF file and generate compliance reports as to whether systems match the desired configuration.

This solution is provided as a PowerShell module, and it includes a customizable reporting engine that can provide reports on overall compliance and details on any DSC resource found to be not in compliance in an environment.  Compliance scanning has been implemented utilizing multi-threading practices, and has capabilities for scale and throttling for large environments.

DSCEA is an Open-Source Project, hosted at [https://github.com/Microsoft/DSCEA](https://github.com/Microsoft/DSCEA)
<br><i>Contributions are welcomed and encouraged</i>
 
## Report Examples
DSCEA currently supports displaying scan result data in either Power BI or HTML
<p class="ImageTextHeaderFirst">Display DSCEA scan results within Power BI</p>
[ ![](https://raw.githubusercontent.com/Microsoft/DSCEA/master/docs/images/PowerBIHome_Small.png) ](https://raw.githubusercontent.com/Microsoft/DSCEA/master/docs/images/PowerBIHome_Large.png)

<p class="ImageTextHeader">HTML Report - Are systems matching the desired configuration?</p>
[ ![](https://raw.githubusercontent.com/Microsoft/DSCEA/master/docs/images/OverallComplianceReport_Small.png) ](https://raw.githubusercontent.com/Microsoft/DSCEA/master/docs/images/OverallComplianceReport_Large.png)

<p class="ImageTextHeader">HTML Report - Show all non-compliant items that were detected</p>
[ ![](https://raw.githubusercontent.com/Microsoft/DSCEA/master/docs/images/DetailedComplianceReport_Small.png) ](https://raw.githubusercontent.com/Microsoft/DSCEA/master/docs/images/DetailedComplianceReport_Large.png)


## Examples

### **Example 1: Scan multiple systems for compliance to settings defined within a localhost.mof file located in your current directory**
<pre><code>PS C:\> Start-DSCEAscan -MofFile .\localhost.mof -ComputerName dsctest-1, dsctest-2, dsctest-3</code></pre>

This command executes a DSCEA scan against 3 remote systems, dsctest-1, dsctest-2 and dsctest-3 using a locally defined MOF file that exists in the current directory.  This MOF file specifies the settings to check for during the scan.  Start-DSCEAscan returns a XML results file containing raw data that can be used with other functions, such as Get-DSCEAreport to create reports with consumable information.

### **Example 2: Scan multiple systems for compliance to settings defined within a localhost.mof file using the full file path**
<pre><code>PS C:\> Start-DSCEAscan -MofFile C:\Users\username\Documents\DSCEA\localhost.mof -ComputerName dsctest-1, dsctest-2, dsctest-3</code></pre>

This command executes a DSCEA scan against 3 remote systems, dsctest-1, dsctest-2 and dsctest-3 using a locally defined MOF file that exists at "C:\Users\username\Documents\DSCEA".  This MOF file specifies the settings to check for during the scan.  Start-DSCEAscan returns a XML results file containing raw data that can be used with other functions, such as Get-DSCEAreport to create reports with consumable information.

### **Example 3: Scan multiple systems using a carriage return style input file for compliance to settings defined within a localhost.mof file located in your current directory**
<pre><code>PS C:\> Start-DSCEAscan -MofFile .\localhost.mof -InputFile C:\Users\username\Documents\DSCEA\computers.txt</code></pre>

This command executes a DSCEA scan against the systems listed within "C:\Users\username\Documents\DSCEA\computers.txt" using a locally defined MOF file that exists in the current directory.  This MOF file specifies the settings to check for during the scan.  Start-DSCEAscan returns a XML results file containing raw data that can be used with other functions, such as Get-DSCEAreport to create reports with consumable information.

### **Example 4: Scan multiple systems using a carriage return style input file for compliance to settings defined within a localhost.mof file using the full file path**
<pre><code>PS C:\> Start-DSCEAscan -MofFile C:\Users\username\Documents\DSCEA\localhost.mof -InputFile C:\Users\username\Documents\DSCEA\computers.txt</code></pre>

This command executes a DSCEA scan against the systems listed within "C:\Users\username\Documents\DSCEA\computers.txt" using a locally defined MOF file that exists at "C:\Users\username\Documents\DSCEA".  This MOF file specifies the settings to check for during the scan.  Start-DSCEAscan returns a XML results file containing raw data that can be used with other functions, such as Get-DSCEAreport to create reports with consumable information.

### **Example 5: Scan multiple systems for compliance to settings defined within a localhost.mof file using the full file path - Syntax Detail Example**
<pre><code>PS C:\> Start-DSCEAscan -MofFile C:\Users\username\Documents\DSCEA\localhost.mof -ComputerName dsctest-1, dsctest-2, dsctest-3 -OutputPath C:\Temp\DSCEA\Output -ResultsFile "results.xml" -LogsPath C:\Temp\DSCEA\Logs -JobTimeout 10 -ScanTimeout 60 -Force -Verbose</code></pre>

This command executes a DSCEA scan against 3 remote systems, dsctest-1, dsctest-2 and dsctest-3 using a locally defined MOF file that exists at "C:\Users\username\Documents\DSCEA".  This MOF file specifies the settings to check for during the scan.  Start-DSCEAscan returns a XML results file containing raw data that can be used with other functions, such as Get-DSCEAreport to create reports with consumable information.

This command specifies custom values for **-OutputPath** and **-LogsPath**, which must be directories that are pre-existing to store results and logs from the scan.  This scan also specifies custom values for **-ResultsFile** to provide the file name of the scan results file, **-JobTimeout** and **-ScanTimeout** which provide new timeout values for individual system timeouts and the overall scan timeout, a **-Force** option which attempts to close any running DSC related processes on systems being scanned before a scan begins to avoid LCM conflicts and **-Verbose**, which will provide full verbose output of the scan process.

### **Example 6: Scan multiple non-domain systems for compliance to settings defined within a localhost.mof file using the full file path and New-CimSession**
<pre><code>PS C:\> $UserName = 'LocalUser'

        $Password = ConvertTo-SecureString -String "P@ssw0rd" -AsPlainText -Force
        
        $Servers = "dsctest-4,dsctest-5,dsctest-6"
        
        $Cred =  New-Object System.Management.Automation.PsCredential -ArgumentList $UserName, $Password
        
        $Sessions = New-CimSession -Authentication Negotiate -ComputerName $Servers -Credential $Cred
        
        Start-DscEaScan -CimSession $Sessions -MofFile C:\Users\username\Documents\DSCEA\localhost.mof -Verbose
</code></pre>

This command utilizes New-CimSession and executes a DSCEA scan against 3 remote non-domain systems, dsctest-4, dsctest-5 and dsctest-6 using a locally defined MOF file that exists at "C:\Users\username\Documents\DSCEA".  This MOF file specifies the settings to check for during the scan.  Start-DSCEAscan returns a XML results file containing raw data that can be used with other functions, such as Get-DSCEAreport to create reports with consumable information.

### **Example 7: Generate HTML Report based on scan results - Overall System Compliance**
<pre><code>PS C:\Users\username\Documents\DSCEA> Get-DSCEAreport -Overall</code></pre>

This command is executed from a directory that contains DSCEA scan result XML files.  It generates a report of overall system compliance, and will mark a system as non-compliant if it does not fully match the desired configuration.

### **Example 8: Generate HTML Report based on scan results - Show all non-compliant items detected**
<pre><code>PS C:\Users\username\Documents\DSCEA> Get-DSCEAreport -Detailed</code></pre>

This command is executed from a directory that contains DSCEA scan result XML files.  It generates a report containing a list of all items that were found to be non-compliant.  If all systems that are scanned are found to be compliant, this report will show no results.

### **Example 9: Generate HTML Report based on scan results - Show the compliance state of a single item across all systems that were scanned**

<pre><code>PS C:\Users\username\Documents\DSCEA> Get-DSCEAreport -ItemName MicrosoftAntiMalwareService</code></pre>

This command is executed from a directory that contains DSCEA scan result XML files.  It generates a report containing the compliance state for the Microsoft AntiMalware Service across all systems that were scanned.  The item name specified must match one of the resource names that was defined within the MOF file that was used to perform the scan.

### **Example 10: Generate HTML Report based on scan results - Show the compliance state of all items for a single system**

<pre><code>PS C:\Users\username\Documents\DSCEA> Get-DSCEAreport -ComputerName dsctest-1</code></pre>

This command is executed from a directory that contains DSCEA scan result XML files.  It generates a report containing the compliance state for all items that were scanned on system dsctest-1.

In addition, Get-DSCEAreport supports the **-InFile** parameter, which can be used to specify the full file path of the results XML file to be used for report generation.  In the previous examples of Get-DSCEAreport, the XML file used is the most recent XML file detected within the current directory.

Get-DSCEAreport also supports the **-OutPath** parameter, which can be used to specify the path to store the generated HTML files.  This path must point to a pre-existing folder.

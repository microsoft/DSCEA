---
title: Scan Execution
sidebar: mydoc_sidebar
permalink: mydoc_scan.html
folder: mydoc
---

## Scan Execution Examples

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
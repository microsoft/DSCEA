---
title: Report Generation with HTML
sidebar: mydoc_sidebar
permalink: mydoc_report_web.html
folder: mydoc
---

## HTML Report Generation Examples

### **Example 1: Generate HTML Report based on scan results - Overall System Compliance**
<pre><code>PS C:\> C:\Users\username\Documents\DSCEA> Get-DSCEAreport -Overall</code></pre>

This command is executed from a directory that contains DSCEA scan result XML files.  It generates a report of overall system compliance, and will mark a system as non-compliant if it does not fully match the desired configuration.

### **Example 2: Generate HTML Report based on scan results - Show all non-compliant items detected**
<pre><code>PS C:\> C:\Users\username\Documents\DSCEA> Get-DSCEAreport -Detailed</code></pre>

This command is executed from a directory that contains DSCEA scan result XML files.  It generates a report containing a list of all items that were found to be non-compliant.  If all systems that are scanned are found to be compliant, this report will show no results.

### **Example 3: Generate HTML Report based on scan results - Show the compliance state of a single item across all systems that were scanned**
<pre><code>PS C:\> C:\Users\username\Documents\DSCEA> Get-DSCEAreport -ItemName MicrosoftAntiMalwareService</code></pre>

This command is executed from a directory that contains DSCEA scan result XML files.  It generates a report containing the compliance state for the Microsoft AntiMalware Service across all systems that were scanned.  The item name specified must match one of the resource names that was defined within the MOF file that was used to perform the scan.

### **Example 4: Generate HTML Report based on scan results - Show the compliance state of all items for a single system**
<pre><code>PS C:\> C:\Users\username\Documents\DSCEA> Get-DSCEAreport -ComputerName dsctest-1</code></pre>

This command is executed from a directory that contains DSCEA scan result XML files.  It generates a report containing the compliance state for all items that were scanned on system dsctest-1.

In addition, Get-DSCEAreport supports the **-InFile** parameter, which can be used to specify the full file path of the results XML file to be used for report generation.  In the previous examples of Get-DSCEAreport, the XML file used is the most recent XML file detected within the current directory.

Get-DSCEAreport also supports the **-OutPath** parameter, which can be used to specify the path to store the generated HTML files.  This path must point to a pre-existing folder.
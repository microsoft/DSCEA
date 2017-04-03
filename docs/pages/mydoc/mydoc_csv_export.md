---
title: Convert DSCEA scan result to CSV
sidebar: mydoc_sidebar
permalink: mydoc_csv_export.html
folder: mydoc
---

## DSCEA results to CSV Examples

### **Example 1: Convert result data stored in a results.xml file to CSV using full file paths**
<pre><code>PS C:\> Convert-DSCEAresultsToCSV -InputXML C:\Users\username\Documents\DSCEA\results.20170401-2252-51.xml -OutFile C:\Users\username\Documents\DSCEA\output.csv</code></pre>

This command will convert the XML file supplied for the InputXML parameter to a CSV file saved to the location supplied for the OutFile parameter.

### **Example 2: Convert result data stored in a results.xml file to CSV using the most recent XML file in your current directory**
<pre><code>PS C:\Users\username\Documents\DSCEA\> Convert-DSCEAresultsToCSV</code></pre>

This command will attempt to convert the most recent XML file found in your current directory to a CSV file called output.csv and it will save this file in your current directory.
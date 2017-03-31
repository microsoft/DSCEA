---
title: Report Generation with Power BI
sidebar: mydoc_sidebar
permalink: mydoc_report_powerbi.html
folder: mydoc
---

## DSCEA Reporting with PowerBI

DSCEA includes a function called Convert-DSCEAresultsToCSV.

This function can be executed after a successful run of Start-DSCEAscan and its purpose is to take the XML output that is generated from Start-DSCEAscan and convert it to a CSV file that can be easily used with Power BI.  This can be done with or without an Office 365 subscription, as [Power BI Desktop](https://powerbi.microsoft.com/en-us/desktop/) is a free option available for creating reports that does not require Office 365.

Convert-DSCEAresultsToCSV searches your scan results file path for the most recently created XML file and it takes this file and outputs a file called output.csv

Download [DSCEA.pbix](https://raw.githubusercontent.com/Microsoft/DSCEA/master/resources/DSCEA.pbix) to view a demo report, and refresh it with your own CSV data once you have completed a scan and run Convert-DSCEAresultsToCSV. 

In order to use your own CSV data, open the PBIX. Select "edit queries" from the top ribbon. Select "Output" on the left pane. On the right pane, under "Applied Steps", look for the row labelled "Source" (the first step). Click the gear next to it. In the dialogue that appears, change the file path to the location of your CSV. Click "OK". Click "Close and apply" in the top left of the ribbon. 

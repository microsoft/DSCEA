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
<p class="ImageTextHeaderFirst">Are systems matching the desired configuration?</p>
[ ![](https://github.com/rkyttle/DSCEA/raw/dev/docs/images/OverallComplianceReport_Small.png) ](https://github.com/rkyttle/DSCEA/raw/dev/docs/images/OverallComplianceReport_Large.png)

<p class="ImageTextHeader">Show all non-compliant items that were detected</p>
[ ![](https://github.com/rkyttle/DSCEA/raw/dev/docs/images/DetailedComplianceReport_Small.png) ](https://github.com/rkyttle/DSCEA/raw/dev/docs/images/DetailedComplianceReport_Large.png)

<p class="ImageTextHeader">Feeling creative? Display DSCEA scan results within Power BI</p>
<video class="tscplayer_inline" controls poster="https://rkyttle.github.io/DSCEA/mp4/HomePagePowerBIGIF_First_Frame.png" preload="none">
   <source src="https://rkyttle.github.io/DSCEA/mp4/HomePagePowerBIGIF.mp4" type="video/mp4">
   Your browser does not support the HTML video tag.
</video>

## Examples

### Example 1: Scan multiple systems for compliance to settings defined within a localhost.mof file located in your current directory
```powershell
PS C:\> Start-DSCEAscan -MofFile .\localhost.mof -ComputerName dsctest-1, dsctest-2, dsctest-3
```

This command does abc

### Example 2: Scan multiple systems for compliance to settings defined within a localhost.mof file using the full file path
```powershell
PS C:\> Start-DSCEAscan -MofFile C:\Users\username\Documents\DSCEA\localhost.mof -ComputerName dsctest-1, dsctest-2, dsctest-3
```

This command does def

### Example 3: Scan multiple systems **(names provided in a text file as a carriage return style list)** for compliance to settings defined within a localhost.mof file located in your current directory
```powershell
PS C:\> Start-DSCEAscan -MofFile .\localhost.mof -InputFile C:\Users\username\Documents\DSCEA\computers.txt
```

This command does uvw

### Example 4: Scan multiple systems **(names provided in a text file as a carriage return style list)** for compliance to settings defined within a localhost.mof file using the full file path
```powershell
PS C:\> Start-DSCEAscan -MofFile C:\Users\ralph\Documents\DSCEA\localhost.mof -InputFile C:\Users\username\Documents\DSCEA\computers.txt
```

This command does xyz

## Solution Workflow

Visio - multiple panes, showing the steps
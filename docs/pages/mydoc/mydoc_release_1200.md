---
title: 1.2.0.0 Release notes
sidebar: mydoc_sidebar
permalink: mydoc_release_1200.html
folder: mydoc
---

## Changelog

* Introduced exciting new updates to Start-DSCEAscan
    * Automatic copying of any custom resources needed for a scan from the management system to the remote endpoints being scanned
        * Thank you to [Anthony Watherston](https://github.com/anwather) for adding this capability to DSCEA!
    * Added a new Path parameter, which allows Start-DSCEAscan to take in a folder path containing machine specific MOF files to allow for a scan of those systems against unique per system settings

* Added additional config examples
    * Config that uses non built-in DSC resources
    * Config that showcases using the DSC script resource
        * Thank you to [Patrick Mercier](https://www.linkedin.com/in/patrick-mercier-80876941/) for your contributions and feedback on this!

* Bug fixes
    * Fixed issue where errors were thrown when running **Import-Module DSCEA**
        * Thank you to [Melissa Januszko](https://github.com/majst32) for pointing this out!
    * Fixed quote character issue when running **Get-Help Start-DSCEAscan**

* Documentation updates
    * Clarified instructions on Report Generation with Power BI page
        * Thank you to [Zachary Alexander](https://github.com/zjalexander) for updating this page!
    * Clarified instructions on PowerShell Gallery - Offline Install page
    * Added page - Convert DSCEA scan result to CSV
    * Added page - DSCEA Functions Reference
---
title: 1.0.0.0 Release notes
sidebar: mydoc_sidebar
permalink: mydoc_release_1000.html
folder: mydoc
---

## Overview

This is the first release of DSCEA - Version 1.0.0.0

DSCEA supports Windows Operating Systems running PowerShell version 5 or above

Linux support is not available at this time because DSCEA depends on Test-DscConfiguration -ReferenceConfiguration, which is not currently available for Linux systems

## Notable features

Some of the more prominent features DSCEA version 1.0.0.0 include the following:

* Scan results are saved to XML at the end of a scan, allowing multiple reports to be run against the same data without requiring additional scanning
* System validation testing (Verifies systems to be scanned are online and running PowerShell version 5 or above)
* Error handling capabilities and logging
* Timeout settings can be configured per system or per scan
* Force option which can kill the LCM on remote systems if the LCM gets stuck
* HTML based compliance reports
* Power BI based compliance reports
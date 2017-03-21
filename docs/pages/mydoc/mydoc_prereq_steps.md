---
title: Prerequisite Steps
sidebar: mydoc_sidebar
permalink: mydoc_prereq_steps.html
folder: mydoc
---

## Overview

* Open PowerShell ISE as Administrator
* If the DSCEA module is not already installed, install the DSCEA module then close and relaunch the ISE as Administrator
* Define a DSC reference configuration containing the settings you wish to scan and generate a MOF file
	* A SampleConfig.ps1 file is included in the DSCEA module directory within a configs subdirectory if you would like an example or you are just starting out
* Decide which systems you would like to scan, and prepare to either enter system names on the command line or create a text file containing the machine names
* If you would like to test the compliance of the management system you are executing the scan from, you can use the system name localhost in either your command line or computers text file

## Assumptions

* DNS resolution is working with either system short name or FQDN
* Any duplicate system short names are made unique by FQDN 
---
title: Background
sidebar: mydoc_sidebar
permalink: mydoc_background.html
folder: mydoc
---

## Why DSCEA was created

PowerShell Desired State Configuration is typically thought of as a management system that enables deploying configurations.  In normal use of DSC, all modes start with at least one apply action, making it difficult to test the impact of pushing a change. New features were added to PowerShell starting with Version 5 that enable the ability to use DSC to audit systems for configuration compliance without actually applying any DSC configurations.

DSC Environment Analyzer (DSCEA) utilizes the DSC processing engine and DSC resources to look at and report on the existing configuration of machines in an environment. 

DSCEA was co-created by Ralph Kyttle and Keith Hitchcock and it was first released in March 2017.

## It all starts with Test-DscConfiguration
  
DSCEA uses the Test-DscConfiguration cmdlet and its ability in PowerShell 5 to refer to a reference MOF file to compare systems in an environment for compliance against a MOF file without actually making any changes to those systems.

Example output from Test-DscConfiguration

Example DSCEA output, can be same from intro page
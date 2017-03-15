---
title: Background
sidebar: mydoc_sidebar
permalink: mydoc_background.html
folder: mydoc
---

## Why DSCEA was created

PowerShell Desired State Configuration is typically thought of as a management system that enables **deploying** configurations.  In normal use of DSC, all configuration modes start with an apply action, making it difficult to test the impact of pushing a change. New features were added to PowerShell starting with Version 5 that enable the ability to use DSC to audit systems for configuration compliance against a desired baseline.

DSC Environment Analyzer (DSCEA) utilizes the DSC processing engine and DSC resources to look at and report on the existing configuration of machines in an environment. 

DSCEA was co-created by Ralph Kyttle and Keith Hitchcock and it was first released in March 2017.

## It all starts with Test-DscConfiguration
  
DSCEA uses the Test-DscConfiguration cmdlet and its new ability introduced in PowerShell 5 to refer to a reference MOF file and compare systems in an environment for compliance against that MOF file without making any configuration changes to those systems.

Example output from Test-DscConfiguration

[ ![](https://github.com/rkyttle/DSCEA/raw/dev/docs/images/TestDscConfiguration_Small.png) ](https://github.com/rkyttle/DSCEA/raw/dev/docs/images/TestDscConfiguration_Large.png)

Looping 403 ppt progression

Example DSCEA output, can be same from intro page
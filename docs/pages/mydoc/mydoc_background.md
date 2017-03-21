---
title: Background
sidebar: mydoc_sidebar
permalink: mydoc_background.html
folder: mydoc
---

## Why DSCEA was created

PowerShell Desired State Configuration is typically thought of as a management system that enables **deploying** configurations.  In normal use of DSC, all configuration modes start with an apply action, making it difficult to test the impact of pushing a change. New features were added to PowerShell starting with Version 5 that enable the ability to use DSC to audit systems for configuration compliance against a desired baseline.

DSC Environment Analyzer (DSCEA) utilizes the DSC processing engine and DSC resources to audit and report on the existing configuration of machines in an environment.

By using PowerShell Desired State Configuration at its core, DSCEA obtains some unique advantages.  Most notably, by defining the desired configuration state using DSC, an admin can benefit from using the same work to both scan for compliance, and then decide the speed at which to correct items that were found to be non-compliant.  Building an audit file in DSC can help ease remediations, because in some cases it can be as simple as applying the same MOF file that was used to scan the environment onto systems to correct drift and bring things into the desired state.

DSCEA was co-created by Ralph Kyttle and Keith Hitchcock.

It was first released in March 2017.

## It all starts with Test-DscConfiguration
  
DSCEA uses the Test-DscConfiguration cmdlet and its new ability introduced in PowerShell 5 to refer to a reference MOF file and compare systems in an environment for compliance against that MOF file without making any configuration changes to those systems.

**Example output from Test-DscConfiguration**

[ ![](https://raw.githubusercontent.com/Microsoft/DSCEA/master/docs/images/TestDscConfiguration_Small.png) ](https://raw.githubusercontent.com/Microsoft/DSCEA/master/docs/images/TestDscConfiguration_Large.png)

The Test-DscConfiguration cmdlet provides us with some great information, and it acts as the core of the DSCEA module. 

Using the information returned from Test-DscConfiguration, we can do some really interesting things related to reporting on the configuration of systems in an environment.

Security baseline scanning, operational system checks such as verifying the setting of a particular registry key across all systems in an environment and application level adherence to desired configurations are just a few examples of how DSCEA can make an impact in your environment. 
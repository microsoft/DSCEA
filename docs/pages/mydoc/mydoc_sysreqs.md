---
title: System Requirements
sidebar: mydoc_sidebar
permalink: mydoc_sysreqs.html
folder: mydoc
---

## DSCEA Essentials

* DSCEA currently only supports Windows Operating Systems <br> 
(DSCEA depends on Test-DscConfiguration -ReferenceConfiguration)
* PowerShell version 5 or above must be installed on all systems that interact with the solution 
* PowerShell Remoting and WinRM must be enabled 
* All systems must be members of an Active Directory domain or CimSession configuration and usage is required 
* Management server running Windows Server 2008 R2 SP1 or later that will be used to remotely connect to systems to evaluate their compliance 
* Solution must be executed by a user account that has local Administrator rights on the management server and all endpoint systems
* DSCEA can integrate into hybrid cloud environments, with support for systems running on-premises, at a service provider's location or hosted by a cloud provider
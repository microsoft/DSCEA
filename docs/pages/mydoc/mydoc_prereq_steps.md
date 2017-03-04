---
title: Prerequisite Steps
sidebar: mydoc_sidebar
permalink: mydoc_prereq_steps.html
folder: mydoc
---

## Overview

Open PowerShell ISE as admin - Right click on PowerShell icon and select, "Run ISE as Administrator" - Should we recommend execution in PowerShell console instead of ISE?

Define reference config and generate a mof file - provide link to raas blog post with a simple config against dscea, that blog post does a full walkthrough of execution

Decide which systems you would like to scan

	Options for providing systems via text file or right on command line
	
	a. Assumption: All systems (including the management system) are members of the same domain (CHANGE now that CimSession is available?)
	
	b. Assumption: DNS resolution works
	
	c. Assumption: short name or FQDN works
	
	d. Assumption: any short duplicate names are made unique by FQDN
	
	e. If you want to test compliance of the management system you are logged into, you can add localhost to the list 
	
Now that you have installed dscea module, defined desired settings in dsc config, created a mof file and identified system you want to scan, you are ready to perform a scan

Go to the next section, Scan Execution for details on how to execute a scan
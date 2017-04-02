---
title: PowerShell Gallery - Download
sidebar: mydoc_sidebar
permalink: mydoc_psgallery_download.html
folder: mydoc
---

## Download from PowerShell Gallery - Offline Install

The DSCEA PowerShell module needs to be installed only on the server acting as the management system that will be used to connect to remote systems to evaluate their compliance.

If the server acting as your management system does not have internet access, you can download the DSCEA module from the PowerShell Gallery using an internet connected system and copy the module files over to your management system.

Details on downloading DSCEA from the PowerShell Gallery can be found at the link below:

[https://www.powershellgallery.com/packages/DSCEA](https://www.powershellgallery.com/packages/DSCEA)

The PowerShell Gallery site provides the following command:

<pre><code>PS C:\> Save-Module -Name DSCEA -Path &lt;path&gt; </code></pre>

You must provide an existing folder path on your internet connected system to store the DSCEA module.  Once you have downloaded the DSCEA module, you can copy the module files to C:\Program Files\WindowsPowerShell\Modules or any other location defined in the PSModulePath variable on your management system.

**Download Screenshot**

[ ![](https://raw.githubusercontent.com/Microsoft/DSCEA/master/docs/images/DownloadModule_Small.png) ](https://raw.githubusercontent.com/Microsoft/DSCEA/master/docs/images/DownloadModule_Large.png)
function New-DscEaSampleConfigs {
<#   
.SYNOPSIS   
Creates sample configuration file SampleConfig.ps1

.DESCRIPTION 
Creates SampleConfig.ps1 in Program Files\DSCEA folder

.LINK
htt://aka.ms/dscea
#>
    if(Test-Path $location\SampleConfig.ps1){
        write-output "$location\SampleConfig.ps1 already exists"
    }
    else {
@'
configuration MemberServerSecuritySettings {

    param(
        [string[]]$ComputerName="localhost"
    )
    Import-DscResource -ModuleName PSDesiredStateConfiguration
    Node $ComputerName {   
    
    #Anti-Malware
        Service MicrosoftAntimalwareService{
        Name = "MsMpSvc"
        StartupType = "Automatic"
        State = "Running"
        }
    
    #User Account Control
        Registry ConsentPromptBehaviorAdmin{
        Ensure = "Present"
        Key = "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System"
        ValueName = "ConsentPromptBehaviorAdmin"
        ValueType = "Dword"
        ValueData = "5"
        }  

        Registry PromptOnSecureDesktop{
        Ensure = "Present"
        Key = "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System"
        ValueName = "PromptOnSecureDesktop"
        ValueType = "Dword"
        ValueData = "1"
        }

	#Interactive logon: Number of previous logons to cache (in case domain controller is not available)
        Registry Numberofpreviouslogonstocache{
        Ensure = "Present"
        Key = "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows NT\CurrentVersion\Winlogon"
        ValueName = "CachedLogonsCount"
        ValueType = "Dword"
        ValueData = "2"
        }

    #Checks to ensure that certain Windows Roles or Windows Features have not been installed
        WindowsFeature ActiveDirectoryDomainServices{
            Name = 'AD-Domain-Services'
            Ensure = 'Absent'
        }
	
		WindowsFeature DNSServer{
            Name = 'DNS'
            Ensure = 'Absent'
        }
    
	    WindowsFeature DHCPServer{
            Name = 'DHCP'
            Ensure = 'Absent'
        }

		WindowsFeature WindowsRoleFax{
            Name = 'Fax'
            Ensure = 'Absent'
        }

		#WindowsFeature TelnetServer {
        #    Name = 'Telnet-Server'
        #    Ensure = 'Absent'
        #}

        }
		        
}

MemberServerSecuritySettings -OutputPath $env:ProgramFiles\DSC-EA

#Uncomment the following code to replace the default call to MemberServerSecuritySettings shown above if you would like to generate machine specific MOF files.  Then comment out the default call above.

#    ForEach ($system in (Get-Content $env:ProgramFiles\DSC-EA\computers.ps1))
#    {
#      MemberServerSecuritySettings -OutputPath $env:ProgramFiles\DSC-EA -ComputerName $system
#    }
'@ | Set-Content -Path $location\SampleConfig.ps1 -Force
    }
    if(Test-Path $location\SampleApplyConfig.ps1){
        write-output "$location\SampleApplyConfig.ps1 already exists"
    }
    else {
@'
param([parameter(mandatory=$true,position=1)][string[]]$Computers)
configuration MemberServerSecuritySettings {

    param(
        [string[]]$ComputerName="localhost"
    )
    Import-DscResource -ModuleName PSDesiredStateConfiguration
    Node $ComputerName {   
       
    #User Account Control
        Registry ConsentPromptBehaviorAdmin{
        Ensure = "Present"
        Key = "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System"
        ValueName = "ConsentPromptBehaviorAdmin"
        ValueType = "Dword"
        ValueData = "5"
        }  

        Registry PromptOnSecureDesktop{
        Ensure = "Present"
        Key = "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System"
        ValueName = "PromptOnSecureDesktop"
        ValueType = "Dword"
        ValueData = "1"
        }

	#Interactive logon: Number of previous logons to cache (in case domain controller is not available)
        Registry Numberofpreviouslogonstocache{
        Ensure = "Present"
        Key = "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows NT\CurrentVersion\Winlogon"
        ValueName = "CachedLogonsCount"
        ValueType = "Dword"
        ValueData = "2"
        }
    }	        
}

$Computers | ForEach-Object {
    MemberServerSecuritySettings -OutputPath $env:ProgramFiles\DSC-EA -ComputerName $_
}
'@ | Set-Content -Path $location\SampleApplyConfig.ps1 -Force
    }
}

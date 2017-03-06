configuration MemberServerSecuritySettings {
    param([string[]]$ComputerName='localhost')

    Import-DscResource -ModuleName PSDesiredStateConfiguration
    
    Node $ComputerName {   

        #Anti-Malware
        Service 'MicrosoftAntimalwareService' {
            Name        = 'MsMpSvc'
            StartupType = 'Automatic'
            State       = 'Running'
        }

        #User Account Control - (1 of 2)
        Registry 'ConsentPromptBehaviorAdmin' {
            Ensure    = 'Present'
            Key       = 'HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System'
            ValueName = 'ConsentPromptBehaviorAdmin'
            ValueType = 'Dword'
            ValueData = '5'
        }  

        #User Account Control - (2 of 2)
        Registry 'PromptOnSecureDesktop' {
            Ensure    = 'Present'
            Key       = 'HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System'
            ValueName = 'PromptOnSecureDesktop'
            ValueType = 'Dword'
            ValueData = '1'
        }

        #Interactive logon: Number of previous logons to cache (in case domain controller is not available)
        Registry 'Numberofpreviouslogonstocache' {
            Ensure    = 'Present'
            Key       = 'HKEY_LOCAL_MACHINE\Software\Microsoft\Windows NT\CurrentVersion\Winlogon'
            ValueName = 'CachedLogonsCount'
            ValueType = 'Dword'
            ValueData = '2'
        }

        #Checks to ensure that certain Windows Roles or Windows Features have not been installed
        WindowsFeature 'ActiveDirectoryDomainServices' {
            Name   = 'AD-Domain-Services'
            Ensure = 'Absent'
        }

        #Ensure DNS service is not installed
        WindowsFeature 'DNSServer' {
            Name   = 'DNS'
            Ensure = 'Absent'
        }

        #Ensure DHCP service is not installed
        WindowsFeature 'DHCPServer' {
            Name   = 'DHCP'
            Ensure = 'Absent'
        }

        #Ensure FaxServer service is not installed
        WindowsFeature 'WindowsRoleFax' {
            Name   = 'Fax'
            Ensure = 'Absent'
        }
    }            
}

MemberServerSecuritySettings -OutputPath .\
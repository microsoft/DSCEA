configuration ScriptResourceSample {
    Import-DscResource -ModuleName PSDesiredStateConfiguration
    
    Node 'localhost' {   
        #Disables RDP
        Script 'ScriptResourceOne' {
            GetScript = {
                @{
                    Results = (Get-NetFirewallRule -DisplayGroup 'Remote Desktop').Enabled
                } #Returns a HashTable @{}
            }
            TestScript = {
                ((Get-NetFirewallRule -DisplayGroup 'Remote Desktop').Enabled).Contains('False') #Returns True or False
            }
            SetScript = {
                Set-NetFirewallRule -DisplayGroup 'Remote Desktop' -Enabled True #Makes it so!
            }
        }
    }    
}

ScriptResourceSample -OutputPath .\
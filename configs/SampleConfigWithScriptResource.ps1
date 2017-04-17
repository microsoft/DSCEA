configuration ScriptResourceSample {
    Import-DscResource -ModuleName PSDesiredStateConfiguration
    
    Node 'localhost' {   
        #Disables RDP
        Script 'ScriptResourceOne' {
            GetScript = {
                @{
                    Results = (Get-NetFirewallRule -DisplayGroup 'Remote Desktop').Enabled
                }
                #Returns a HashTable @{}
            }
            TestScript = {
                $state = Invoke-Expression $GetScript
                if( $state.results -Contains("True") ) { #We do not want any of the Remote Desktop firewall rules enabled, so if any of the rules return a value of True, we want the test to fail
                    return $false
                }
                else {
                    return $true
                }
                #Returns True or False on whether the system is in the desired state
            }
            SetScript = {
                Disable-NetFirewallRule -DisplayGroup 'Remote Desktop'
                #Makes it so!
            }
        }
    }    
}

ScriptResourceSample -OutputPath .\
$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path) -replace '\.Tests\.', '.'
. "$here\..\functions\$sut"

Describe $sut {
    Context 'SampleConfig.ps1 exists but SampleApplyConfig.ps1 does not' {
        Mock Test-Path {$true} -ParameterFilter {$Path -like '*\SampleConfig.ps1'}
        Mock Test-Path {$false} -ParameterFilter {$Path -like '*\SampleApplyConfig.ps1'}
        Mock Set-Content {[CmdletBinding()] param ([Parameter(ValueFromPipeline = $true)] $Value,[switch]$Force,$Path)} -ParameterFilter {$Path -like '*\SampleApplyConfig.ps1'}
        It 'Should not create SampleConfig.ps1' {
            New-DscEaSampleConfigs | Should be '\SampleConfig.ps1 already exists'
        }
        It 'Should create SampleApplyConfig.ps1' {

        }
    }
    Context 'SampleConfig.ps1 does not exists but SampleApplyConfig.ps1 exists' {
        Mock Test-Path {$false} -ParameterFilter {$Path -like '*\SampleConfig.ps1'}
        Mock Test-Path {$true} -ParameterFilter {$Path -like '*\SampleApplyConfig.ps1'}
        Mock Set-Content {[CmdletBinding()] param ([Parameter(ValueFromPipeline = $true)] $Value,[switch]$Force,$Path)} -ParameterFilter {$Path -like '*\SampleConfig.ps1'}
        It 'Should not create SampleConfig.ps1' {
            New-DscEaSampleConfigs | Should be '\SampleApplyConfig.ps1 already exists'
        }
        It 'Should create SampleApplyConfig.ps1' {
            
        }
    }
}
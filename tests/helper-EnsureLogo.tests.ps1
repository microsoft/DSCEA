$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path) -replace '\.Tests\.', '.'
. "$here\..\functions\$sut"

Describe $sut {
    Context 'Logo already present on system' {
        Mock Test-Path {$true} -ParameterFilter {$Path -notlike '*\DSCEA\Output\logo.png'}
        Mock Copy-Item {}
        It 'Should not copy logo' {
            helper-EnsureLogo | Assert-MockCalled Copy-Item -Times 0
        }
    }
    Context 'Logo not already present on system' {
        Mock Test-Path {$false} -ParameterFilter {$Path -like 'C:\Program Files\WindowsPowerShell\Modules\DSCEA'}
        Mock Join-Path {'C:\Program Files\WindowsPowerShell\Modules\DSCEA\Output\logo.png'}
        Mock Copy-Item {}
        It 'Should copy logo to DSCEA folder' {
            helper-EnsureLogo | Assert-MockCalled Copy-Item -Times 1
        }
    }
}
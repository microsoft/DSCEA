$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path) -replace '\.Tests\.', '.'
. "$here\..\functions\$sut"

Describe $sut {
    Context 'Example computers.ps1 file already present on system' {
        Mock Test-Path {$true}
        Mock New-Item {}
        Mock Set-Content {}
        It 'Should not create sample computers.ps1' {
            New-DscEaSampleComputers | Should be "\computers.ps1 already exists"
        }
    }
    Context 'Example computers.ps1 file not already present on system' {
        Mock Test-Path {$false}
        Mock New-Item {}
        Mock Set-Content {}
        Mock writeFile {}
        It 'Should create sample computers.ps1' {
            $result = New-DscEaSampleComputers
            $result | Assert-MockCalled New-Item -Times 1
            $result | Assert-MockCalled Set-Content -Times 1
            #$result | Assert-MockCalled writeFile -Times 1
        }
    }
}
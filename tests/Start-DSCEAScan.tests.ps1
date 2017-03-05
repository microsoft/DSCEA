$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path) -replace '\.Tests\.', '.'
. "$here\..\functions\$sut"

Describe $sut {
    It 'Should default to .\localhost.mof' {

    }
    It 'Should be able to accept a relative path MOF' {

    }
    It 'Should be able to accept an absolute path MOF' {

    }
    It 'Should be able to use a default output path' {

    }
    It 'Should be able to use a relative output path' {

    }
    It 'Should be able to use an absolute output path' {

    }
    It 'Should be able to use the default logs path' {

    }
    It 'Should be able to use a relative logs path' {

    }
    It 'Should be able to use an absolute logs path' {

    }
    It 'Should be able to use the default results file' {

    }
    It 'Should be able to use a custom results file' {

    }
    It 'Should be able to handle a computer name' {

    }
    It 'Should be able to handle multiple computer names' {

    }
    It 'Should be able to handle a CIM session' {

    }
    It 'Should be able to handle multiple CIM sessions' {
        
    }
}
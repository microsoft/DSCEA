function helper-DataFileMustExist {
    if(-not (Test-Path $env:ProgramFiles\DSC-EA\computers.xml)){
        $data = @{
            AllNodes = @()
            NonNodeData = ''
        }
        $data | Export-Clixml $env:ProgramFiles\DSC-EA\computers.xml
    }
}
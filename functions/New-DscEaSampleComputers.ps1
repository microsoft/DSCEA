function New-DscEaSampleComputers {
<#   
.SYNOPSIS   
Creates sample configuration file for computers.ps1

.DESCRIPTION 
Creates computers.ps1 in Program Files\DSCEA folder

.LINK
htt://aka.ms/dscea
#>
    if(Test-Path $location\computers.ps1){
        return "$location\computers.ps1 already exists"
    }
    else { 
		New-Item -force -ItemType File -Path $location\computers.ps1
		Set-Content $location\computers.ps1 "DSCTEST01`r`nDSCTEST02"
		writeFile('C:\Program Files\DSC-EA\computers.ps1')  
    }
}

function writeFile {
	param ($Path)
	$stream = [IO.File]::OpenWrite($Path)
	$stream.SetLength($stream.Length - 2)
	$stream.Close()
	$stream.Dispose() 
}
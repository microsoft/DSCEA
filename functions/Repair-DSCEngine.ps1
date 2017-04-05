function Repair-DSCEngine {
    [CmdletBinding()]
    param
    (
    [ValidateNotNullOrEmpty()]
    [string[]]$ComputerName
    )

    #kill the dsc processes on the remote system
    Invoke-Command -ComputerName $ComputerName -ScriptBlock {

        ### find the process that is hosting the DSC engine
        $dscProcess = Get-WmiObject msft_providers | 
        Where-Object {$_.provider -like 'dsccore'} | 
        Select-Object -ExpandProperty HostProcessIdentifier 

        ### Stop the process
        do {
            $processID = Get-Process -Id $dscProcess
            $processID | Stop-Process -Force}
        while ($processID.ProcessName -match "WmiPrvSE")
    } -ErrorAction SilentlyContinue
}
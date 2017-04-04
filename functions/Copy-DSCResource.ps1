function Copy-DSCResource {
    [cmdletBinding()]
    Param($PSSession,$ModulestoCopy)
    
    foreach ($Module in $ModulestoCopy)
    {
        $Source = 'C:\Program Files\WindowsPowerShell\Modules\'+$Module.ModuleName
        Write-Verbose "Module location: $Source"
        $Destination = 'C:\Program Files\WindowsPowerShell\Modules\'
        try
        {
            Write-Verbose "Copying"
            Copy-Item -ToSession $PSSession -Path $Source -Destination $Destination -Recurse -Force -ErrorAction STOP -Verbose
            Write-Verbose "Copied"
        }
        catch
        {
            Write-Output $Error[0].Exception
            break
        }
    }

}
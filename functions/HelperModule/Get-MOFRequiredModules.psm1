function Get-MOFRequiredModules {
    [CmdletBinding()]
    Param($mofFile)

    $DSCResources = Get-DscResource
    $DScModuleArray = @()
    $ModulesToCopy = @()

    foreach ($Resource in $DscResources)
    {
        if (!(($Resource.ModuleName -eq "PSDesiredStateConfiguration") -or ($Resource.ImplementedAs -eq 'Binary')))
        {
            if ($DScModuleArray -notcontains $Resource.ModuleName)
            {
                $DSCModuleArray += $Resource.ModuleName
            }
        }
    }

    #Scan the mof file for sections ModuleName
    $requiredModulesinMof = @()
    Switch -Regex (Get-Content $mofFile)
    {
        "ModuleName" {$requiredModulesInMof += $_.Split("`"")[1]}
        #Default {Write-Output $_}
    }

    foreach ($requiredModule in $requiredModulesInMof)
    {
        if ($requiredModule -in $DSCModuleArray)
        {
            $ModulesToCopy += [pscustomobject]@{
                        ModuleName = $requiredModule
                        #ModulePath = $DSCResources | Where ModuleName -eq $requiredModule | Select -ExpandProperty ParentPath
                        }
        }
    }

    return $ModulesToCopy

}

function Copy-DSCResource
{
    [cmdletBinding()]
    Param($CimSession,$ModulestoCopy)
    
    foreach ($Module in $ModulestoCopy)
    {
        $Source = 'C:\Program Files\WindowsPowerShell\Modules\'+$Module.ModuleName
        Write-Verbose "Module location: $Source"
        $Destination = 'C:\Program Files\WindowsPowerShell\Modules\'
        try
        {
            Copy-Item -ToSession $CimSession -Path $Source -Destination -Recurse -Force -ErrorAction STOP
        }
        catch
        {
            Write-Output $Error[0].Exception
            break
        }
    }

}



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

param (
    [Parameter(Mandatory=$true)][SecureString]$Password,
    [Parameter(Mandatory=$true)][String]$SPuserID,
    [Parameter(Mandatory=$true)][String]$TenantID
)

$mycreds = New-Object System.Management.Automation.PSCredential ($SPUserID, $Password)
Login-AzureRmAccount -Credential $mycreds -ServicePrincipal -TenantId $TenantID

New-AzureRmResourceGroupDeployment -Name 'Deploy_DSCEA' -ResourceGroupName "DSCEA" -Mode Complete -TemplateFile .\DscEaEnvironment.json -Force -Verbose
#The function below was inspired by Chrissy LeMaire's post at https://blog.netnerds.net/2015/01/powershell-high-performance-techniques-for-importing-csv-to-sql-server/

function Send-DSCEACSVtoSQL {
    param(
        [Parameter(Mandatory=$true)][string]$SQLserver,
        [Parameter(Mandatory=$true)][string]$DatabaseName,
        [Parameter(Mandatory=$true)][string]$TableName,
        [Parameter(ParameterSetName='UserNameAuth')][String]$UserName,
        [Parameter(ParameterSetName='UserNameAuth')][SecureString]$Password,
        [Parameter(ParameterSetName='CredentialAuth')][PSCredential]$Credential,
        [Parameter(Mandatory=$true)]$InputCSV,
        [switch]$RemoveHeaders
    )
    
    #Review For Relevancy
    #if($PSBoundParameters.ContainsKey('RemoveHeaders')) {
    #    $firstRowColumnNames = $true
    #}
    #else {
    #    $firstRowColumnNames = $false
    #}
     
    ################### No need to modify anything below ###################
    [void][Reflection.Assembly]::LoadWithPartialName("System.Data")
    [void][Reflection.Assembly]::LoadWithPartialName("System.Data.SqlClient")
     
    # 50k worked fastest and kept memory usage to a minimum
    $batchsize = 50000
     
    # Get Username and Password from Credential Object
    if($PSBoundParameters.ContainsKey('CredentialAuth')) {
        $connectionstring = 'Data Source={0};User Id={1};Password={2};Initial Catalog={3};' -f $SQLServer,($Credential.UserName),($Credential.GetNetworkCredential().Password),$DatabaseName
    }
    # Use Username and Password that were passed in
    elseif ($PSBoundParameters.ContainsKey('UserName')) {
        $connectionstring = 'Data Source={0};User Id={1};Password={2};Initial Catalog={3};' -f $SQLServer,$UserName,(Convert-SecureStringToString -SecureString $Password),$DatabaseName
    }
    # Use Integrated Authentication
    else {
        $connectionstring = 'Data Source={0};Integrated Security=SSPI;Initial Catalog={1};' -f $SQLServer,$DatabaseName
    }

    $bulkcopy = New-Object Data.SqlClient.SqlBulkCopy($connectionstring, [System.Data.SqlClient.SqlBulkCopyOptions]::TableLock)
    $bulkcopy.DestinationTableName = $table
    $bulkcopy.bulkcopyTimeout = 0
    $bulkcopy.batchsize = $batchsize
    
    $csvDataTable = Import-CSV -Path $InputCSV | out-DataTable

    $bulkcopy.WriteToServer($csvDataTable) 

    # Clean Up
    $bulkcopy.Close()
    $bulkcopy.Dispose()
    $csvDataTable.Dispose()
     
    # Sometimes the Garbage Collector takes too long to clear the huge datatable.
    [System.GC]::Collect()
}
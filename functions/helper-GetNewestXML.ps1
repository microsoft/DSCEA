function helper-GetNewestXML {
    Get-ChildItem $location\Output\results*.xml | Sort-Object -Property LastWriteTime -Descending | Select -First 1
}
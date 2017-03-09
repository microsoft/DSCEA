[string]$webstyle = @'
<style>
BODY{background-color:#0078D7; margin-left:50px; margin-right:auto;}
TABLE{border-width:1px; border-style:solid; border-color:black; border-collapse:collapse; color:black;}
TH{border-width:1px; padding:5px; border-style:solid; border-color:black; background-color:white; color:#12233D; font-family: "Segoe UI", Tahoma, Verdana, Arial, sans-serif;}
TD{border-width:1px; padding:5px; border-style:solid; border-color:black; background-color:#FCEBDA; font-family:Arial;}
titlesection{color:white; font-family: "Segoe UI", Tahoma, Verdana, Arial, sans-serif; font-size:32px; font-weight:bold;}
datesection{color:white; font-family: "Segoe UI", Tahoma, Verdana, Arial, sans-serif;}
</style>
'@

$functionRoot = Join-Path -Path $PSScriptRoot -ChildPath 'Functions' -Resolve

Get-ChildItem -Path $functionRoot -Filter '*.ps1' | ForEach-Object {
    . $_.FullName | Out-Null
}
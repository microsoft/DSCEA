function helper-EnsureLogo {
    if(-not (Test-Path $location\Output\logo.png))
    {
        $env:PSModulePath -split ';' | ForEach-Object {
            if(Test-Path (Join-Path $_ 'DSCEA\Output\logo.png')) {
                Copy-Item (Join-Path $_ 'DSCEA\Output\logo.png') $location\Output\logo.png
            }
        }
    }
}
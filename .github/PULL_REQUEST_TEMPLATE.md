Pull Requests to Master
- [ ] Ensure pull requests to dev are heavily reviewed, tested and scrutinized before approving
- [ ] Run DSCEA through PowerShell Script Analyzer
- [ ] Pester and manual testing completed
- [ ] Update version number in DSCEA.psd1
- [ ] Update documentation with new release notes, link in sidebar pointing to the new page
- [ ] Perform a release on GitHub to get a snapshot of the project added to the releases section with zip file
- [ ] PowerShell gallery upload - download zip of master, remove unwanted things like docs folder, upload to ps gallery
- [ ] If needed, rebase dev on master so it shows all changes have been rolled into master as squash merge is likely to be used

Pull Requests to Dev
- [ ] Check to see if PowerShell shows any errors when running Import-Module DSCEA
- [ ] Review any lingering issues that might still be open and close them if the new release fixes the issues
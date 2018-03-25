Import-Module posh-git

Start-SshAgent -Quiet

$GitPromptSettings.DefaultPromptAbbreviateHomeDirectory = $true

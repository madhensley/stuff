$ErrorActionPreference = "Stop"
$VerbosePreference = "Continue"
Start-Transcript -path C:\Logs\ServerSettings.log -append

# https://docs.microsoft.com/en-us/azure/virtual-desktop/set-up-customize-master-image
# Write-Verbose "Set time zone W. Europe Standard Time on."
# Set-TimeZone -Id "W. Europe Standard Time"

Write-Verbose "Disable automatic windows update installation."
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v NoAutoUpdate /t REG_DWORD /d 1 /f

Write-Verbose "Set up time zone redirection."
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services" /v fEnableTimeZoneRedirection /t REG_DWORD /d 1 /f

Write-Verbose "Disable Storage Sense."
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\StorageSense\Parameters\StoragePolicy" /v 01 /t REG_DWORD /d 0 /f

Write-Verbose "Fix Watson crashes."
remove CorporateWerServer* from Computer\HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\Windows Error Reporting

Write-Verbose "Fix 5k resolution support."
remove CorporateWerServer* from Computer\HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\Windows Error Reporting

Stop-Transcript

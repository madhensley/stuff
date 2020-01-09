# Script to define regional settings on Azure Virtual Machines deployed from the market place
# Author: Alexandre Verkinderen
# Blogpost: https://mscloud.be/configure-regional-settings-and-windows-locales-on-azure-virtual-machines/
#
######################################33

#variables
$regionalsettingsURL = "https://raw.githubusercontent.com/averkinderen/Azure/master/101-ServerBuild/AURegion.xml"
$RegionalSettings = "D:\DERegion.xml"


#downdload regional settings file
$webclient = New-Object System.Net.WebClient
$webclient.DownloadFile($regionalsettingsURL,$RegionalSettings)


# Set Locale, language etc. 
& $env:SystemRoot\System32\control.exe "intl.cpl,,/f:`"$RegionalSettings`""

# Set languages/culture. Not needed perse.
Set-WinSystemLocale de-DE
Set-WinUserLanguageList -LanguageList de-DE -Force
Set-Culture -CultureInfo de-DE
Set-WinHomeLocation -GeoId 94
Set-TimeZone -Name "W. Europe Standard Time"

# restart virtual machine to apply regional settings to current user. You could also do a logoff and login.
Start-sleep -Seconds 40
Restart-Computer
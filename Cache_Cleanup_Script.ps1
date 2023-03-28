$objShell = New-Object -ComObject Shell.Application
$objFolder = $objShell.Namespace(0xA)
$WinTemp = "C:\Windows\SystemTemp\*"

#Removing the Temp Files#
write-Host "Removing System Temp Files" -ForegroundColor DarkGreen
Set-Location "C:\Windows\SystemTemp"
Remove-Item * -Recurse -Force -ErrorAction SilentlyContinue
Set-Location "C:\Windows\Prefetch"
Remove-Item * -Recurse -Force -ErrorAction SilentlyContinue
Set-Location "C:\Documents and Settings" 
Remove-Item ".\*\Local Settings\systemtemp\*" -Recurse -Force -ErrorAction SilentlyContinue
Set-Location "C:\Users"
Remove-Item ".\*\Appdata\Local\SystemTemp\*" -Recurse -Force -ErrorAction SilentlyContinue

#Run Disk Clean up#
Write-Host "Run Windows Disk Clean up" -ForegroundColor Green
cleanmgr /sagerun:1 | Out-Null
$([char]7)
Sleep 3
Write-Host "Cleanup Task Completed" -ForegroundColor Cyan
Sleep 3

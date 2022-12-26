Clear-Host; Write-Host "Updating VMAF/ab-av1...`n`n";

Set-Location ~\AppData\Local\Microsoft\WindowsApps; # CD TO PATH

if ((Test-Path -Path ".\ab-av1.exe") -eq $True) { Remove-Item ".\ab-av1.exe" -Recurse -Force }

Invoke-WebRequest -Uri https://github.com/alexheretic/ab-av1/releases/download/v0.6.1/ab-av1.exe -OutFile .\ab-av1.exe  # DOWNLOAD AB-AV1.EXE FROM RELEASES
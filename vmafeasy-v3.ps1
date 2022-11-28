Clear-Host; Write-Host "Updating VMAF/ab-av1...`n`n";

Set-Location ~\AppData\Local\Microsoft\WindowsApps; # CD TO PATH
        
if ((Test-Path -Path ".\ffmpeg.exe") -eq $True) { Remove-Item ".\ffmpeg.exe" -Recurse -Force }
if ((Test-Path -Path ".\ffprobe.exe") -eq $True) { Remove-Item ".\ffprobe.exe" -Recurse -Force }
if ((Test-Path -Path ".\ab-av1.exe") -eq $True) { Remove-Item ".\ab-av1.exe" -Recurse -Force }

Write-Host "PREREQUISITES IS NOT INSTALLED! Press [ENTER] to begin installation"; Pause; Clear-Host;

Invoke-WebRequest -Uri https://github.com/BtbN/FFmpeg-Builds/releases/download/latest/ffmpeg-master-latest-win64-gpl.zip -OutFile .\ffmpeg.zip;
Expand-Archive -LiteralPath ".\ffmpeg.zip" -DestinationPath ".\";                                                       # DOWNLOAD & EXTRACT FFMPEG
Move-Item -Path .\ffmpeg-master-latest-win64-gpl\bin\ffmpeg.exe -Destination .\;                                        # TAKEOUT FFMPEG.EXE TO PATH
Move-Item -Path .\ffmpeg-master-latest-win64-gpl\bin\ffprobe.exe -Destination .\;                                       # TAKEOUT FFPROBE.EXE TO PATH
Remove-Item ".\ffmpeg.zip" -Recurse -Force;                                                                             # REMOVE FFMPEG ZIP
Remove-Item ".\ffmpeg-master-latest-win64-gpl\" -Recurse -Force;                                                        # REMOVE FFMPEG-MASTER FOLDER
Invoke-WebRequest -Uri https://github.com/alexheretic/ab-av1/releases/download/v0.5.0/ab-av1.exe -OutFile .\ab-av1.exe  # DOWNLOAD AB-AV1.EXE FROM RELEASES
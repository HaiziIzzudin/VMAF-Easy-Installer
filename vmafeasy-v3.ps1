Clear-Host;

Clear-Host; Write-Host "Let's check prerequisites first...`n`n";

if (((Test-Path -Path "~\AppData\Local\Microsoft\WindowsApps\ffmpeg.exe") -and (Test-Path -Path "~\AppData\Local\Microsoft\WindowsApps\ffprobe.exe") -and (Test-Path -Path "~\AppData\Local\Microsoft\WindowsApps\ab-av1.exe")) -eq $false) {
        
    Set-Location ~\AppData\Local\Microsoft\WindowsApps; # CD TO PATH
        
    if ((Test-Path -Path ".\ffmpeg.exe") -eq $True) { Remove-Item ".\ffmpeg.exe" -Recurse -Force }
    if ((Test-Path -Path ".\ffprobe.exe") -eq $True) { Remove-Item ".\ffprobe.exe" -Recurse -Force } 

    Write-Host "PREREQUISITES IS NOT INSTALLED! Press [ENTER] to begin installation"; Pause; Clear-Host;

    Invoke-WebRequest -Uri https://github.com/BtbN/FFmpeg-Builds/releases/download/latest/ffmpeg-master-latest-win64-gpl.zip -OutFile .\ffmpeg.zip;
    Expand-Archive -LiteralPath ".\ffmpeg.zip" -DestinationPath ".\";                                                       # DOWNLOAD & EXTRACT FFMPEG
    Move-Item -Path .\ffmpeg-master-latest-win64-gpl\bin\ffmpeg.exe -Destination .\;                                        # TAKEOUT FFMPEG.EXE TO PATH
    Move-Item -Path .\ffmpeg-master-latest-win64-gpl\bin\ffprobe.exe -Destination .\;                                       # TAKEOUT FFPROBE.EXE TO PATH
    Remove-Item ".\ffmpeg.zip" -Recurse -Force;                                                                             # REMOVE FFMPEG ZIP
    Remove-Item ".\ffmpeg-master-latest-win64-gpl\" -Recurse -Force;                                                        # REMOVE FFMPEG-MASTER FOLDER
    Invoke-WebRequest -Uri https://github.com/alexheretic/ab-av1/releases/download/v0.5.0/ab-av1.exe -OutFile .\ffmpeg.zip  # DOWNLOAD AB-AV1 PRE-BUILT FROM RELEASES
    
    }


else {
        Write-Host "PREREQUISITES IS COMPLETE!`n`nYou can start using ab-av1 now. If you have no clue to start. Press enter to continue. Otherwise, you can exit this window."; Pause; iwr https://github.com/HaiziIzzudin/Code_Scraps/raw/main/abav1_configurados.ps1 | iex;
}
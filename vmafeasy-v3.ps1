Clear-Host;

# DETERMINE PLATFORM
if ((Test-Path -Path "C:\Windows\System32" -PathType Container) -eq $True) { $platform = "WINDOWS"; }
else { $platform = "LINUX"; }

Clear-Host; Write-Host "VMAF SUPER EASY INSTALLER FEAT. SVT-AV1 - YOUR PLATFORM IS $platform`nThis program will help you install and get VMAF up and running with minimal clicks and interactions.`n`nLet's check prerequisites first...`n`n";

if ($platform -eq "WINDOWS") {
    if (((Test-Path -Path "~\AppData\Local\Microsoft\WindowsApps\ffmpeg.exe") -and (Test-Path -Path "~\AppData\Local\Microsoft\WindowsApps\ffprobe.exe") -and (Test-Path -Path "~\AppData\Local\Microsoft\WindowsApps\ab-av1.exe")) -eq $false) {
    
        Read-Host -Prompt "PREREQUISITES IS NOT INSTALLED! Press [ENTER] to begin installation"; Clear-Host;
    
        Set-Location ~\AppData\Local\Microsoft\WindowsApps; # CD TO PATH

        Invoke-WebRequest -Uri https://github.com/BtbN/FFmpeg-Builds/releases/download/latest/ffmpeg-master-latest-win64-gpl.zip -OutFile .\ffmpeg.zip;
        Expand-Archive -LiteralPath ".\ffmpeg.zip" -DestinationPath ".\";                           # DOWNLOAD & EXTRACT FFMPEG
        Move-Item -Path .\ffmpeg-master-latest-win64-gpl\bin\ffmpeg.exe -Destination .\;            # TAKEOUT FFMPEG.EXE TO PATH
        Move-Item -Path .\ffmpeg-master-latest-win64-gpl\bin\ffprobe.exe -Destination .\;           # TAKEOUT FFPROBE.EXE TO PATH
        Remove-Item ".\ffmpeg.zip" -Recurse -Force;                                                 # REMOVE FFMPEG ZIP
        Remove-Item ".\ffmpeg-master-latest-win64-gpl\" -Recurse -Force;                            # REMOVE FFMPEG-MASTER FOLDER
        Invoke-WebRequest -Uri github.com/alexheretic/ab-av1/releases/download/v0.5.0/ab-av1.exe    # DOWNLOAD AB-AV1 PRE-BUILT FROM RELEASES
        }
    else {
        Write-Host "PREREQUISITES IS COMPLETE!`n`nYou can start using ab-av1 now. If you have no clue to start. Press enter to continue. Otherwise, you can exit this window."; Pause; iwr https://github.com/HaiziIzzudin/Code_Scraps/raw/main/abav1_configurados.ps1 | iex;
    }
}
else { # IF PLATFORM = LINUX
    if ((Test-Path -Path "~/.vmafav1softwareidentifier") -eq $false) {
        Read-Host -Prompt "PREREQUISITES IS NOT INSTALLED! Press [ENTER] to begin installation"; Clear-Host;
        sudo apt install software-properties-common -y;  # NOT INSTALLED BY DEFAULT IN DEBIAN, INSTALLED BY DEFAULT IN UBUNTU
        sudo add-apt-repository ppa:savoury1/ffmpeg4 -y; # ADDING PPA:SAVOURY FFMPEG 4
        sudo add-apt-repository ppa:savoury1/ffmpeg5 -y; # ADDING PPA:SAVOURY FFMPEG 5
        curl https://sh.rustup.rs -sSf | sh;             # INSTALL RUSTUP CARGO
        touch ~/.vmafav1softwareidentifier;              # SOFTWARE IDENTIFIER (DO NOT DELETE, OR DELETE TO RENEW FFMPEG )
    }
    sudo apt update; sudo apt upgrade -y; sudo apt install ffmpeg -y;
    
    Write-Host "`nPREREQUISITES INSTALL HAS COMPLETED!`n`n"; Pause; Clear-Host;
    
    Set-Location ~/;                                                    # CHANGE LOCATION TO HOME
    Add-Content -Path ./.bashrc -Value '';
    Add-Content -Path ./.bashrc -Value 'export PATH=~/:$PATH';          # ADD /HOME/USER TO PATH

    exit;                                                               # EXIT POWERSHELL
}
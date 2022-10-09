Clear-Host;

# DETERMINE PLATFORM
if ((Test-Path -Path "C:\Windows\System32" -PathType Container) -eq $True) { $platform = "WINDOWS"; }
else { $platform = "LINUX"; }

Clear-Host; Write-Host "VMAF SUPER EASY INSTALLER FEAT. SVT-AV1 - YOUR PLATFORM IS $platform`nThis program will help you install and get VMAF up and running with minimal clicks and interactions.`n`nLet's check prerequisites first...`n`n";

if ($platform -eq "WINDOWS") {
    if (((Test-Path -Path "~\.cargo\bin\cargo.exe") -and (Test-Path -Path "~\AppData\Local\Microsoft\WindowsApps\ffmpeg.exe") -and (Test-Path -Path "~\AppData\Local\Microsoft\WindowsApps\ffprobe.exe")) -eq $false) {
    
        Read-Host -Prompt "PREREQUISITES IS NOT INSTALLED! Press [ENTER] to begin installation"; Clear-Host;
    
        Set-Location ~\AppData\Local\Microsoft\WindowsApps; # CD TO PATH

        Invoke-WebRequest -Uri https://github.com/BtbN/FFmpeg-Builds/releases/download/latest/ffmpeg-master-latest-win64-gpl.zip -OutFile .\ffmpeg.zip;
        Expand-Archive -LiteralPath ".\ffmpeg.zip" -DestinationPath ".\";                     # DOWNLOAD & EXTRACT FFMPEG
        Move-Item -Path .\ffmpeg-master-latest-win64-gpl\bin\ffmpeg.exe -Destination .\;      # TAKEOUT FFMPEG.EXE TO PATH
        Move-Item -Path .\ffmpeg-master-latest-win64-gpl\bin\ffprobe.exe -Destination .\;     # TAKEOUT FFPROBE.EXE TO PATH
        Remove-Item ".\ffmpeg.zip" -Recurse -Force;                                           # REMOVE FFMPEG ZIP
        Remove-Item ".\ffmpeg-master-latest-win64-gpl\" -Recurse -Force;                      # REMOVE FFMPEG-MASTER FOLDER
        winget install Rustlang.Rustup; winget install Microsoft.VisualStudio.2022.Community; # WINGETS

        # GIVING INSTRUCTIONS TO USER
        Clear-Host; Write-Host "Installation has completed. A reboot is required for be able to run this program."; Pause; exit; # EXIT WT (BCOS WINDOWS RESTART IS REQUIRED)
        }
    else {
        Write-Host "PREREQUISITES IS COMPLETE!"; Pause;

        cargo install ab-av1;                                                             # INSTALL AB-AV1 VIA CARGO

        Read-Host -Prompt "`n`nINSTALLATION DONE! Launch by typing [ab-av1] directly.`nTo start a wizard, enter in [iwr https://github.com/HaiziIzzudin/Code_Scraps/raw/main/abav1_configurados.ps1 | iex] on a new terminal environment.`n`nThank you for using my program! Your support is very valuable for me.`n`nPress [ENTER] to exit installer...";
    }
}
else { # IF PLATFORM = LINUX
    if ((Test-Path -Path "~/.vmafav1softwareidentifier") -eq $false) {
        Read-Host -Prompt "PREREQUISITES IS NOT INSTALLED! Press [ENTER] to begin installation"; Clear-Host;
        sudo apt install software-properties-common -y;  # NOT INSTALLED BY DEFAULT IN DEBIAN, INSTALLED BY DEFAULT IN UBUNTU
        sudo add-apt-repository ppa:savoury1/ffmpeg4 -y; # ADDING PPA:SAVOURY FFMPEG 4
        sudo add-apt-repository ppa:savoury1/ffmpeg5 -y; # ADDING PPA:SAVOURY FFMPEG 5
        curl https://sh.rustup.rs -sSf | sh;             # INSTALL RUSTUP CARGO
        touch ~/.vmafav1softwareidentifier;              # SOFTWARE IDENTIFIER (DO NOT DELETE)
    }
    sudo apt update; sudo apt upgrade -y; sudo apt install ffmpeg gcc cmake yasm clang -y;
    
    Write-Host "`nPREREQUISITES INSTALL HAS COMPLETED!`n`n"; Pause; Clear-Host;
    
    # PREPARATION OF SVTAV1ENCAPP BUILDER
    Set-Location ~/;                                                    # CHANGE LOCATION TO HOME
    git clone https://gitlab.com/AOMediaCodec/SVT-AV1.git ;             # CLONE SVTAV1 REPO
    ~/SVT-AV1/Build/linux/build.sh release;                             # START BUILD SVTAV1ENCAPP
    Move-Item -Path ~/SVT-AV1/Bin/Release/SvtAv1EncApp -Destination ./; # TAKEOUT SVTAV1ENCAPP TO PATH/HOME 
    Remove-Item "~/SVT-AV1" -Recurse -Force;                            # REMOVE SVT-AV1 GIT CLONE
    sudo chmod u+x SvtAv1EncApp;                                        # SET PERMISSION TO EXECUTABLE

    Add-Content -Path ./.bashrc -Value '';
    Add-Content -Path ./.bashrc -Value 'export PATH=~/:$PATH';          # ADD CONTENT TO BASHRC

    exit;                                                               # EXIT POWERSHELL
}
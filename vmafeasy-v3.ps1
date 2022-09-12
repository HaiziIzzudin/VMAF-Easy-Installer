Clear-Host;

# DETERMINE PLATFORM
if ((Test-Path -Path "C:\Windows\System32" -PathType Container) -eq $True) { $platform = "WINDOWS"; }
else { $platform = "LINUX"; }

Clear-Host; Write-Host "VMAF SUPER EASY INSTALLER FEAT. SVT-AV1 - YOUR PLATFORM IS $platform`nThis program will help you install and get VMAF up and running with minimal clicks and interactions.`n`nLet's check prerequisites first...`n`n";

if ($platform -eq "WINDOWS") {
    if (((Test-Path -Path "C:\Program Files\Git\bin\git.exe")                -and (Test-Path -Path "~\.cargo\bin\cargo.exe")                            -and 
        (Test-Path -Path "C:\Program Files\CMake\bin\cmake.exe")             -and (Test-Path -Path "~\AppData\Local\Microsoft\WindowsApps\yasm.exe")    -and
        (Test-Path -Path "~\AppData\Local\Microsoft\WindowsApps\ffmpeg.exe") -and (Test-Path -Path "~\AppData\Local\Microsoft\WindowsApps\ffprobe.exe") -and
        (Test-Path -Path "C:\Program Files\Microsoft Visual Studio\2022\Community\Common7\IDE\devenv.exe")) -eq $false) {
    
        Read-Host -Prompt "PREREQUISITES IS NOT INSTALLED! Press [ENTER] to begin installation"; Pause; Clear-Host;
    
        Set-Location ~\AppData\Local\Microsoft\WindowsApps; # CD TO PATH

        Invoke-WebRequest -Uri http://www.tortall.net/projects/yasm/releases/yasm-1.3.0-win64.exe -OutFile .\yasm.exe; # YASM INSTALL
        Invoke-WebRequest -Uri https://github.com/BtbN/FFmpeg-Builds/releases/download/latest/ffmpeg-master-latest-win64-gpl.zip -OutFile .\ffmpeg.zip;
        Expand-Archive -LiteralPath ".\ffmpeg.zip" -DestinationPath ".\";                                              # DOWNLOAD & EXTRACT FFMPEG
        Move-Item -Path .\ffmpeg-master-latest-win64-gpl\bin\ffmpeg.exe -Destination .\;                               # TAKEOUT FFMPEG.EXE TO PATH
        Move-Item -Path .\ffmpeg-master-latest-win64-gpl\bin\ffprobe.exe -Destination .\;                              # TAKEOUT FFPROBE.EXE TO PATH
        Remove-Item ".\ffmpeg.zip" -Recurse -Force;                                                                    # REMOVE FFMPEG ZIP
        Remove-Item ".\ffmpeg-master-latest-win64-gpl\" -Recurse -Force;                                               # REMOVE FFMPEG FOLDER
        Invoke-WebRequest -Uri "https://c2rsetup.officeapps.live.com/c2r/downloadVS.aspx?sku=community&channel=Release&version=VS2022&source=VSLandingPage&includeRecommended=true&cid=2030:63428752a0eb4551b273af591d9c7491" -OutFile .\msvc.exe; .\msvc.exe;            # DOWNLOAD & RUN MSVC MANUALLY
        Clear-Host; Write-Host "A Visual-Studio-Installer installer has running.`n`nOn WORKLOADS tab, tick [Desktop development with C++], and click [INSTALL].`n`nAfter installation, you need to run it for first time.`n`nAfter running, you can close it."; Pause;
        Remove-Item ".\msvc.exe" -Recurse -Force;                                                                      # REMOVE MSVC-INSTALLER INSTALLER

        winget install Git.Git; winget install Rustlang.Rustup; winget install Kitware.CMake;                          # WINGETS

        # GIVING INSTRUCTIONS TO USER
        Clear-Host; Write-Host "Installation has completed. A new Windows Terminal window will open after this. I want you to:`n1. COPY this command NOW!!! [iwr https://rebrand.ly/vmafeasywin | iex] (exclude the square bracket)`n2. PASTE it onto the new terminal window that will open later."; Pause;

        wt; exit; # LAUNCH A NEW WINDOWS TERMINAL, AND EXIT THE CURRENT WT (BCOS SHELL RESTART IS REQUIRED)
        }
    else {
        Write-Host "PREREQUISITES IS COMPLETE!"; Pause;
    
        Set-Location ~\AppData\Local\Microsoft\WindowsApps; # PATHING LOCATIONS

        # PREPARATION OF SVTAV1ENCAPP BUILDER
        git clone https://gitlab.com/AOMediaCodec/SVT-AV1.git ;                                                     # CLONE SVTAV1 REPO
        ~\AppData\Local\Microsoft\WindowsApps\SVT-AV1\Build\windows\build.bat 2022 release                          # START BUILD SVTAV1ENCAPP
        Move-Item -Path ~\AppData\Local\Microsoft\WindowsApps\SVT-AV1\Bin\Release\SvtAv1EncApp.exe -Destination .\; # TAKEOUT SVTAV1ENCAPP.EXE TO PATH 
        Move-Item -Path ~\AppData\Local\Microsoft\WindowsApps\SVT-AV1\Bin\Release\SvtAv1Enc.dll -Destination .\;    # TAKEOUT SVTAV1ENC.DLL TO PATH
        Move-Item -Path ~\AppData\Local\Microsoft\WindowsApps\SVT-AV1\Bin\Release\SvtAv1Enc.exp -Destination .\;    # TAKEOUT SVTAV1ENC.EXP TO PATH
        Move-Item -Path ~\AppData\Local\Microsoft\WindowsApps\SVT-AV1\Bin\Release\SvtAv1Enc.lib -Destination .\;    # TAKEOUT SVTAV1ENC.LIB TO PATH
        Remove-Item "~\AppData\Local\Microsoft\WindowsApps\SVT-AV1" -Recurse -Force;                                # REMOVE SVT-AV1 GIT CLONE

        cargo install ab-av1; # INSTALL AB-AV1 VIA CARGO

        Read-Host -Prompt "`n`nINSTALLATION DONE! Launch by typing [ab-av1] directly.`nFor more info on how to use, do refer to this doc [https://alexheretic.github.io/posts/ab-av1/].`n`nThank you for using my program! Your support is very valuable for me.`n`nPress [ENTER] to exit installer...";
    }
}
else { # IF PLATFORM = LINUX
    if ((Test-Path -Path "~/.vmafav1softwareidentifier") -eq $false) {
        Read-Host -Prompt "PREREQUISITES IS NOT INSTALLED! Press [ENTER] to begin installation"; Clear-Host;
        sudo add-apt-repository ppa:savoury1/ffmpeg4 -y; # ADDING PPA:SAVOURY FFMPEG 4
        sudo add-apt-repository ppa:savoury1/ffmpeg5 -y; # ADDING PPA:SAVOURY FFMPEG 5
        curl https://sh.rustup.rs -sSf | sh;             # INSTALL RUSTUP CARGO
        touch ~/.vmafav1softwareidentifier;              # SOFTWARE IDENTIFIER (DO NOT DELETE)
    }
    Set-Location ~/; source ~/.bashrc;                   # CD TO HOME & REFRESH ENVIRONMENT VARIABLE
    
    sudo apt update; sudo apt upgrade -y; sudo apt install ffmpeg gcc cmake yasm clang-11 -y; rustup update; cargo update;
    
    Write-Host "`nPREREQUISITES INSTALL HAS COMPLETED!`n`n"; Pause; Clear-Host;
    
    cargo install ab-av1;                                # INSTALL AB-AV1 VIA CARGO
    
    # PREPARATION OF SVTAV1ENCAPP BUILDER
    git clone https://gitlab.com/AOMediaCodec/SVT-AV1.git ;             # CLONE SVTAV1 REPO
    ~/SVT-AV1/Build/linux/build.sh release;                             # START BUILD SVTAV1ENCAPP
    Move-Item -Path ~/SVT-AV1/Bin/Release/SvtAv1EncApp -Destination ./; # TAKEOUT SVTAV1ENCAPP TO PATH/HOME 
    Remove-Item "~/SVT-AV1" -Recurse -Force;                            # REMOVE SVT-AV1 GIT CLONE
    
    Clear-Host; Write-Host "FINAL STEP!`n`n1. Copy this command NOW!!!: "'[export PATH=~/:$PATH]'" (without square bracket)`n2. A .bashrc file will be open after this. Navigate to bottom (using arrow keys), and PASTE to a new line.`n3. [CTRL + X], then [CTRL + Y], then [ENTER].`n`nUnderstood?"; Pause;

    nano ./.bashrc;                                                     # USER TO EDIT BASHRC, AND SAVE IT
    Set-Location ~/; source ~/.bashrc;                                  # CD TO HOME & REFRESH ENVIRONMENT VARIABLE
    
    Read-Host -Prompt "`n`nINSTALLATION DONE! Launch by typing [ab-av1] directly.`nFor more info on how to use, do refer to this doc [https://alexheretic.github.io/posts/ab-av1/].`n`nThank you for using my program! Your support is very valuable for me.`n`nPress [ENTER] to exit installer...";
}
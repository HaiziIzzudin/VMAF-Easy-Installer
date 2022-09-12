Clear-Host;

function prereq {
    # prerequisites software locations (easy for PATHing)
    Set-Location ~\AppData\Local\Microsoft\WindowsApps;

    # prereq download required
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

    # prereq installable thru winget
    winget install Git.Git;                 # GIT.EXE
    winget install Rustlang.Rustup;         # CARGO.EXE
    winget install Kitware.CMake;           # CMAKE.EXE

    # GIVING INSTRUCTIONS TO USER
    Clear-Host;
    Write-Host "Installation has completed. A new Windows Terminal window will open after this. I want you to:`n";
    Pause;

    wt; exit; # LAUNCH A NEW WINDOWS TERMINAL, AND EXIT THE CURRENT WT (BCOS SHELL RESTART IS REQUIRED)
}

if (((Test-Path -Path "C:\Program Files\Git\bin\git.exe")                -and (Test-Path -Path "~\.cargo\bin\cargo.exe")                            -and 
    (Test-Path -Path "C:\Program Files\CMake\bin\cmake.exe")             -and (Test-Path -Path "~\AppData\Local\Microsoft\WindowsApps\yasm.exe")    -and
    (Test-Path -Path "~\AppData\Local\Microsoft\WindowsApps\ffmpeg.exe") -and (Test-Path -Path "~\AppData\Local\Microsoft\WindowsApps\ffprobe.exe") -and
    (Test-Path -Path "C:\Program Files\Microsoft Visual Studio\2022\Community\Common7\IDE\devenv.exe")) -eq $false) 
    {
    Write-Host "PREREQUISITES INCOMPLETE! Press any key to download all prerequisites required.";
    Pause; Clear-Host; prereq;
    }
else {
    Write-Host "PREREQUISITES IS COMPLETE!";
    Pause;
    
    Set-Location ~\AppData\Local\Microsoft\WindowsApps;                                                       # PATHING LOCATIONS

    # PREPARATION OF SVTAV1ENCAPP BUILDER
    git clone https://gitlab.com/AOMediaCodec/SVT-AV1.git ;                                                   # CLONE SVTAV1 REPO
    ~\AppData\Local\Microsoft\WindowsApps\SVT-AV1\Build\windows\build.bat 2022                                # START BUILD SVTAV1ENCAPP
    Move-Item -Path ~\AppData\Local\Microsoft\WindowsApps\SVT-AV1\Bin\Debug\SvtAv1EncApp.exe -Destination .\; # TAKEOUT SVTAV1ENCAPP.EXE TO PATH 
    Move-Item -Path ~\AppData\Local\Microsoft\WindowsApps\SVT-AV1\Bin\Debug\SvtAv1EncApp.dll -Destination .\; # TAKEOUT SVTAV1ENCAPP.DLL TO PATH
    Remove-Item "~\AppData\Local\Microsoft\WindowsApps\SVT-AV1" -Recurse -Force;                              # REMOVE SVT-AV1 GIT CLONE

    cargo install ab-av1;                                                                                     # INSTALL AB-AV1 VIA CARGO

    Read-Host -Prompt "`n`nINSTALLATION DONE! Launch by typing [ab-av1] directly.`nFor more info on how to use, do refer to this doc [https://alexheretic.github.io/posts/ab-av1/].`n`nThank you for using my program! Your support is very valuable for me.`n`nPress [ENTER] to exit installer...";
}
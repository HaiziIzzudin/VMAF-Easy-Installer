# A COLLECTION OF TEST-PATHS TO SEE IF ALL PACKAGES HAS BEEN INSTALLED
(Test-Path -Path "C:\Windows\System32" -PathType Container) && 



# prerequisites software install
Set-Location ~\AppData\Local\Microsoft\WindowsApps;

# prereq download required
Invoke-WebRequest -Uri http://www.tortall.net/projects/yasm/releases/yasm-1.3.0-win64.exe -OutFile .\yasm.exe;      # YASM INSTALL
Invoke-WebRequest -Uri https://github.com/BtbN/FFmpeg-Builds/releases/download/latest/ffmpeg-master-latest-win64-gpl.zip -OutFile .\ffmpeg.zip;
Expand-Archive -LiteralPath ".\ffmpeg.zip" -DestinationPath ".\";                                                   # DOWNLOAD & EXTRACT FFMPEG
Move-Item -Path .\ffmpeg-master-latest-win64-gpl\bin\ffmpeg.exe -Destination .\;                                    # TAKEOUT FFMPEG.EXE TO USERDATA
Move-Item -Path .\ffmpeg-master-latest-win64-gpl\bin\ffprobe.exe -Destination .\;                                   # TAKEOUT FFPROBE.EXE TO USERDATA
Remove-Item ".\ffmpeg.zip" -Recurse -Force;                                                                         # REMOVE FFMPEG ZIP
Remove-Item ".\ffmpeg-master-latest-win64-gpl\" -Recurse -Force;                                                    # REMOVE FFMPEG FOLDER
Invoke-WebRequest -Uri https://c2rsetup.officeapps.live.com/c2r/downloadVS.aspx?sku=community&channel=Release&version=VS2022&source=VSLandingPage&includeRecommended=true&cid=2030:63428752a0eb4551b273af591d9c7491 -OutFile .\msvc.exe; .\msvc.exe;                  # DOWNLOAD & RUN MSVC MANUALLY
Clear-Host; Write-Host "A Visual Studio installer has running.`n`nOn INDIVIDUAL COMPONENTS tab, search for Windows SDK, Windows version depends on your Windows version currently running.`n`nAfter installation, you need to run it for first time."; Pause;
Remove-Item ".\msvc.exe" -Recurse -Force;                                                                           # REMOVE MSVC-INSTALLER INSTALLER

# prereq installable thru winget
winget install Git.Git;
winget install Rustlang.Rustup;
winget install Kitware.CMake;

wt; exit; # LAUNCH A NEW WINDOWS TERMINAL, AND EXIT THE CURRENT WT (BCOS SHELL RESTART IS REQUIRED)

cargo install ab-av1; # install ab-av1

# PREPARATION OF SVTAV1ENCAPP BUILDER
git clone https://gitlab.com/AOMediaCodec/SVT-AV1.git;              # CLONE SVTAV1 REPO


if ((Test-Path -Path "C:\Windows\System32" -PathType Container) -eq $True) {}
else {}
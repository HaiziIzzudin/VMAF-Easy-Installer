# prerequisites software install
Set-Location ~\AppData\Local\Microsoft\WindowsApps;

winget install Git.Git;
winget install Rustlang.Rustup;
winget install Kitware.CMake;
winget install Microsoft.VC++2017Redist-x86;
winget install Microsoft.VC++2017Redist-x64;
winget install Microsoft.VC++2015Redist-x86;
winget install Microsoft.VC++2015Redist-x64;
winget install Microsoft.VC++2015-2022Redist-x86;
winget install Microsoft.VC++2015-2022Redist-x64;
winget install Microsoft.VC++2015-2019Redist-x86;
winget install Microsoft.VC++2015-2019Redist-x64;
winget install Microsoft.VC++2013Redist-x86;
winget install Microsoft.VC++2013Redist-x64;
winget install Microsoft.VC++2012Redist-x86;
winget install Microsoft.VC++2012Redist-x64;
winget install Microsoft.VC++2010Redist-x86;
winget install Microsoft.VC++2010Redist-x64;
winget install Microsoft.VC++2008Redist-x86;
winget install Microsoft.VC++2008Redist-x64;
winget install Microsoft.VC++2005Redist-x86;
winget install Microsoft.VC++2005Redist-x64;

Invoke-WebRequest -Uri http://www.tortall.net/projects/yasm/releases/yasm-1.3.0-win64.exe -OutFile .\yasm.exe;

Invoke-WebRequest -Uri https://github.com/BtbN/FFmpeg-Builds/releases/download/latest/ffmpeg-master-latest-win64-gpl.zip -OutFile .\ffmpeg.zip;
Expand-Archive -LiteralPath ".\ffmpeg.zip" -DestinationPath ".\";
Remove-Item ".\ffmpeg.zip" -Recurse -Force;
Move-Item -Path .\ffmpeg-master-latest-win64-gpl\bin\ffmpeg.exe -Destination .\; # Move ffmpeg.exe to userdata
Move-Item -Path .\ffmpeg-master-latest-win64-gpl\bin\ffprobe.exe -Destination .\; # Move ffmpeg.exe to userdata
Remove-Item ".\ffmpeg-master-latest-win64-gpl\" -Recurse -Force;

cargo install ab-av1; # install ab-av1

# preparation of SvtAv1EncApp
git clone https://gitlab.com/AOMediaCodec/SVT-AV1.git;
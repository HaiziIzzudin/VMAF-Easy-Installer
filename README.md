# TOO LONG; DIDN'T READ

Make sure to already `sudo apt update && sudo apt upgrade -y` your linux PC before performing commands below!

Copy and paste below command into terminal (LINUX & DEBIAN & BASH CMD ONLY. Windows soon?).
```
sudo apt install curl -y; curl https://sh.rustup.rs -sSf | sh; cargo install ab-av1; sudo apt update && sudo apt upgrade -y; sudo apt remove ffmpeg -y; sudo add-apt-repository ppa:savoury1/ffmpeg4 -y; sudo add-apt-repository ppa:savoury1/ffmpeg5 -y; sudo apt update && sudo apt upgrade -y; sudo apt install ffmpeg -y; git clone https://gitlab.com/AOMediaCodec/SVT-AV1.git; sudo apt install gcc cmake yasm clang -y; ~/SVT-AV1/Build/linux/build.sh release; cp ~/SVT-AV1/Bin/Release/SvtAv1EncApp ~/; chmod u+x SvtAv1EncApp; clear; echo 'Youre almost done. After this, a nano .bashrc editor will be opened. I need you to go to the end of the line (navigate using arrow key), make a new line, and paste this command: export PATH=~/:$PATH (C&P NOW). To save the file, press [CTRL + X], then [CTRL + Y], then press [ENTER] (MUST REMEMBER THE STEPS CORRECTLY)'; read -p "Understood? Press any key to continue..."; nano .bashrc; rm -rf ~/SVT-AV1; clear; echo "That's it. Program has been installed. Need some guides? Do refer to https://alexheretic.github.io/posts/ab-av1/";
```

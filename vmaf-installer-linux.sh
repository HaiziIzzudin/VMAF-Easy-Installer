sudo apt install software-properties-common -y;  # NOT INSTALLED BY DEFAULT IN DEBIAN, INSTALLED BY DEFAULT IN UBUNTU
sudo add-apt-repository ppa:savoury1/ffmpeg4 -y; # ADDING PPA:SAVOURY FFMPEG 4
sudo add-apt-repository ppa:savoury1/ffmpeg5 -y; # ADDING PPA:SAVOURY FFMPEG 5
curl https://sh.rustup.rs -sSf | sh;             # INSTALL RUSTUP CARGO
sudo apt update; 
sudo apt upgrade -y; 
sudo apt install ffmpeg -y;
cargo install ab-av1;
# 1.0 TOO LONG; DIDN'T READ

## 1.1 - Install for Linux (UBUNTU 2004/2204 - BASH)

1. If you are a first time user (or you formatted your Linux PC), you need to INSTALL PowerShell. Enter in below command into terminal. 

   Else if you already has installed PowerShell (or you are a comeback customer), SKIP THIS STEP.
```
sudo apt update;sudo apt upgrade -y;sudo apt install -y curl gnupg apt-transport-https;curl https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -;sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/microsoft-debian-bullseye-prod bullseye main" > /etc/apt/sources.list.d/microsoft.list';sudo apt update && sudo apt install -y powershell;
```
2. Enter in `pwsh`.

3. Enter in below command to proceed for further instructions...
```
iwr rebrand.ly/vmafeasywin | iex
```
4. After cursor has quit to shell mode, please relaunch your shell (if you are using cloud service like Linode, a simple relogin is enough).

5. Enter in:
```
cargo install ab-av1;
```
6. THAT'S IT! To use, enter in `ab-av1`

## 1.2 Install for Windows 10 and above (WINDOWS TERMINAL - POWERSHELL)

*Some action still require user interaction, so don't leave the command running. We need you.*

1. Copy the command below:
```
iwr rebrand.ly/vmafeasywin | iex
```

2. Paste into Windows Terminal, and press [ENTER].

***Disclaimer: All rebrand.ly links is linked to the raw script inside this GitHub. No outside script were used. Don't believe me? Enter the rebrand.ly links into your browser then. It must have a domain name and TLD "raw.githubusercontent.com/..."***

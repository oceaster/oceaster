echo "[GITHUB] Identification Required"
echo ""
echo "User Name:"
read gitHubName
echo ""
echo "Email Address:"
read gitHubEmail
echo ""
echo ""

echo "[GITHUB] Setting Global Config"
echo ""
echo "Setting Email"
git config --global user.email "${gitHubEmail}"
echo ""
echo "Setting Name"
git config --global user.name "${gitHubName}"
echo ""
echo ""

echo "[GITHUB] Generate New SSH Token"
echo ""
ssh-keygen -t ed25519 -C "${gitHubEmail}"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
echo ""
echo ""

echo "[GITHUB] SSH Key Generated, Success!"
echo ""
cat ~/.ssh/id_ed25519.pub
echo ""
echo "Press [ENTER] once you have added this SSH Key to your GitHub Account..."
read waitForEnter
echo ""
echo ""

# [REMOVE OLD] General APT Requirements
sudo apt purge -y --auto-remove nodejs npm
sudo apt purge -y --auto-remove docker docker-compose

# [INSTALL NEW] General APT Requirements
sudo apt install -y git wget curl snapd docker docker-compose
sudo apt update -y
sudo apt upgrade -y
sudo apt autoremove -y

# Python Requirements
sudo apt install -y python3.9 python-is-python3 python3-pip
sudo python3.9 -m pip3 install --upgrade django cors django-cors-headers whitenoise pylint pytest pytest-django django-extensions
sudo apt update -y
sudo apt upgrade -y
sudo apt autoremove -y

# Node (LTS Version 16) Requirements
curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash -
sudo apt-get install -y nodejs
sudo apt update -y
sudo apt upgrade -y
sudo apt autoremove -y

# Setup Home Directory
cd
sudo rm -rf Music
sudo rm -rf Pictures
sudo rm -rf Public
sudo rm -rf Templates
sudo rm -rf Videos
mkdir .logs
mkdir Media
mkdir Games
mkdir Beeks

# Setup Developer Repository
cd
dev.uninstall
dev.download
dev.install
sudo rm ~/.bashrc
sudo cp ~/Dev/Sys/.bashrc ~/.bashrc
cd

# Microsoft Edge (Default Web Browser)
sudo apt update -y
sudo apt install -y wget software-properties-common apt-transport-https
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/edge stable main"
sudo apt update -y
sudo apt install -y microsoft-edge-stable

sudo apt update -y
sudo apt upgrade -y
sudo apt autoremove -y

# Microsoft VSCode (IDE)
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] \
https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
rm -f packages.microsoft.gpg
sudo apt update -y
sudo apt install -y code

# Microsoft Teams (Business Communication Platform)
curl https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/ms-teams stable main" > /etc/apt/sources.list.d/teams.list'

sudo apt update -y
sudo apt install -y teams

# Discord (Default Personal Communication Platform)
sudo snap install -y discord

# VLC Media Player (Default Media Player)
sudo snap install -y vlc

# Youtube Music (Default Music App)
sudo snap install -y youtube-music-desktop-app

# Keybase (Encrypted Cloud Storage)
curl --remote-name https://prerelease.keybase.io/keybase_amd64.deb
sudo apt install -y ./keybase_amd64.deb
run_keybase

# Deluge (Default Torrent Client)
sudo apt install -y deluge

# Steam (Default Personal Game Store & Library)
sudo apt install -y steam

# Finalize System Setup with Update, Upgrade and Autoremove
sudo apt update -y
sudo apt upgrade -y
sudo apt autoremove -y

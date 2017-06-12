#!bin/bash
# install vscode
echo "install vscode ..."
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt update
sudo apt install code

# install common used apt packages
echo "common used apt packages ..."
sudo apt install git vim filezilla

# install nodejs 8
echo "install nodejs 8 ..."
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
sudo apt install -y nodejs

# download and install stacer 1.0.7 (a system cleaning app)
# repo: https://github.com/oguzhaninan/Stacer
echo "download and install stacer 1.0.7 (a system cleaning app) ..."
wget https://github.com/oguzhaninan/Stacer/releases/download/v1.0.7/stacer_1.0.7_amd64.deb
# install dependencies
sudo apt install gconf2 libappindicator1 libindicator7
sudo dpkg -i stacer_1.0.7_amd64.deb
sudo rm -r stacer_1.0.7_amd64.deb

# check and install missing dependencies, cleanup
echo "check and install missing dependencies ..."
sudo apt install -f
sudo apt autoremove
sudo apt autoclean



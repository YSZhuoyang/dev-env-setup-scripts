#!bin/bash
# install vscode
echo "\nInstall vscode ...\n"
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt update
sudo apt install -y code

# install common used apt packages
echo "\n Install common used apt packages ...\n"
sudo apt install -y git vim filezilla

# install nodejs 8
echo "\nInstall nodejs 8 ...\n"
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
sudo apt install -y nodejs

# download and install stacer 1.0.7 (a system cleaning app)
# repo: https://github.com/oguzhaninan/Stacer
#echo "\nDownload and install stacer 1.0.7 (a system cleaning app) ...\n"
#wget https://github.com/oguzhaninan/Stacer/releases/download/v1.0.7/stacer_1.0.7_amd64.deb
# install dependencies
#sudo apt install gconf2 libappindicator1 libindicator7
#sudo dpkg -i stacer_1.0.7_amd64.deb
#sudo rm -r stacer_1.0.7_amd64.deb

# check and install missing dependencies, cleanup
echo "\nCheck and install missing dependencies ...\n"
sudo apt install -f -y
sudo apt autoremove -y
sudo apt autoclean -y



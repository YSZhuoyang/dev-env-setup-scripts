#!/bin/bash


# install common used apt packages and update system packages
printf "Install common used apt packages and update built-in packages ...\n\n"
sudo apt update
sudo apt install -y git vim filezilla
sudo apt upgrade -y

# install vscode
read -p "Do you want to install vscode? Y/y for yes; Others for no: " ANS
if [[ $ANS == "y" || $ANS == "Y" ]]
then
    printf "\nInstall vscode ...\n\n"
    curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
    sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
    sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
    sudo apt update
    sudo apt install -y code
fi

# install nodejs 8
read -p "Do you want to install nodejs 8? Y/y for yes; Others for no: " ANS
if [[ $ANS == "y" || $ANS == "Y" ]]
then
    printf "\nInstall nodejs 8 ...\n\n"
    curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
    sudo apt install -y nodejs

    # install npm packages
    read -p "Do you want to install create-react-app npm package? Y/y for yes; Others for no: " ANS
    if [[ $ANS == "y" || $ANS == "Y" ]]
    then
        printf "\nInstall create-react-app ...\n\n"
        sudo npm install -g create-react-app
    fi
fi

# install mongoDB for Ubuntu 16.04
read -p "Do you want to install mongoDB for Ubuntu 16.04? Y/y for yes; Others for no: " ANS
if [[ $ANS == "y" || $ANS == "Y" ]]
then
    printf "\nInstall mongoDB for Ubuntu 16.04 ...\n\n"
    sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 0C49F3730359A14518585931BC711F9BA15703C6
    echo "deb [ arch=amd64,arm64 ] http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.4 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.4.list
    sudo apt update
    sudo apt install -y mongodb-org
fi

# install Open MPI compiler
read -p "Do you want to install Open MPI compiler? Y/y for yes; Others for no: " ANS
if [[ $ANS == "y" || $ANS == "Y" ]]
then
    printf "\nInstall Open MPI compiler ...\n\n"
    sudo apt install -y libopenmpi-dev
fi

# install Docker community version
read -p "Do you want to install Docker community version? Y/y for yes; Others for no: " ANS
if [[ $ANS == "y" || $ANS == "Y" ]]
then
    printf "\nInstall Docker community version ...\n\n"
    sudo apt install -y apt-transport-https ca-certificates curl software-properties-common
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
    sudo add-apt-repository \
        "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
        $(lsb_release -cs) \
        stable"
    sudo apt update
    sudo apt install -y docker-ce
fi

# install Ansible
read -p "Do you want to install Ansible? Y/y for yes; Others for no: " ANS
if [[ $ANS == "y" || $ANS == "Y" ]]
then
    printf "\nInstall Ansible ...\n\n"
    sudo apt install software-properties-common
    sudo apt-add-repository ppa:ansible/ansible
    sudo apt update
    sudo apt install -y ansible
fi

# download and install stacer 1.0.7 (a system cleaning app)
# repo: https://github.com/oguzhaninan/Stacer
read -p "Do you want to install stacer 1.0.7? Y/y for yes; Others for no: " ANS
if [[ $ANS == "y" || $ANS == "Y" ]]
then
    printf "\nDownload and install stacer 1.0.7 (a system cleaning app) ...\n\n"
    wget https://github.com/oguzhaninan/Stacer/releases/download/v1.0.7/stacer_1.0.7_amd64.deb
    install dependencies
    sudo apt install gconf2 libappindicator1 libindicator7
    sudo dpkg -i stacer_1.0.7_amd64.deb
    sudo rm -r stacer_1.0.7_amd64.deb
fi

# install .Net core (dotnet-dev-1.0.4)
read -p "Do you want to install .Net core (dotnet-dev-1.0.4)? Y/y for yes; Others for no: " ANS
if [[ $ANS == "y" || $ANS == "Y" ]]
then
    printf "\nInstall .Net core (dotnet-dev-1.0.4) ...\n\n"
    sudo sh -c 'echo "deb [arch=amd64] https://apt-mo.trafficmanager.net/repos/dotnet-release/ yakkety main" > /etc/apt/sources.list.d/dotnetdev.list'
    sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 417A0893
    sudo apt update
    sudo apt install -y dotnet-dev-1.0.4
fi

# check and install missing dependencies, cleanup ...
printf "\nCheck and install missing dependencies ...\n\n"
sudo apt install -f -y
sudo apt autoremove -y
sudo apt autoclean

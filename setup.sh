#!/bin/bash
# This script is used to install packages and configure environment on Ubuntu for convenience.

# install common used apt packages and update system packages
printf "Install common used apt packages and update built-in packages ...\n\n"
sudo apt update
sudo apt install -y git vim filezilla curl
sudo apt upgrade -y

# install vscode
read -p "Do you want to install vscode? Y/y for yes; Others for no: " ANS
if [[ $ANS == "y" || $ANS == "Y" ]]
then
    printf "\nInstall dependencies ...\n\n"
    sudo apt install -y xclip
    printf "\nInstall vscode ...\n\n"
    curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
    sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
    sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
    sudo apt update
    sudo apt install -y code
fi

# install nodejs 10
read -p "Do you want to install nodejs 10? Y/y for yes; Others for no: " ANS
if [[ $ANS == "y" || $ANS == "Y" ]]
then
    printf "\nInstall nodejs 10 ...\n\n"
    curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
    sudo apt install -y nodejs

    # install npm packages
    read -p "Do you want to install create-react-app npm package? Y/y for yes; Others for no: " ANS
    if [[ $ANS == "y" || $ANS == "Y" ]]
    then
        printf "\nInstall create-react-app ...\n\n"
        sudo npm install -g create-react-app
    fi

    read -p "Do you want to install eslint npm package? Y/y for yes; Others for no: " ANS
    if [[ $ANS == "y" || $ANS == "Y" ]]
    then
        printf "\nInstall eslint ...\n\n"
        sudo npm install -g eslint
    fi

    read -p "Do you want to install typescript? Y/y for yes; Others for no: " ANS
    if [[ $ANS == "y" || $ANS == "Y" ]]
    then
        printf "\nInstall tslint and tsc ...\n\n"
        sudo npm install -g tslint typescript
    fi

    read -p "Do you want to install lessjs? Y/y for yes; Others for no: " ANS
    if [[ $ANS == "y" || $ANS == "Y" ]]
    then
        printf "\nInstall less npm ...\n\n"
        sudo npm install -g less
    fi

fi

# Install golang V1.11
read -p "Do you want to install golang V1.11? Y/y for yes; Others for no: " ANS
if [[ $ANS == "y" || $ANS == "Y" ]]
then
    printf "\nInstall golang V1.11 ...\n\n"
    sudo wget "https://dl.google.com/go/go1.11.linux-amd64.tar.gz"
    sudo tar -C /usr/local -xzf go1.11.linux-amd64.tar.gz
    # Setup environment
    echo "export PATH=\$PATH:/usr/local/go/bin" >> ~/.profile
    echo "export GOPATH=\$HOME/Documents/Sources/GoWorkPlace" >> ~/.profile
    echo "export GOBIN=\$GOPATH/bin" >> ~/.profile
    # Remove temp files
    sudo rm -r go1.11.linux-amd64.tar.gz
fi

# Install CUDA V9.2
read -p "Do you want to install CUDA V9.2.148? Y/y for yes; Others for no: " ANS
if [[ $ANS == "y" || $ANS == "Y" ]]
then
    printf "\nInstall CUDA V9.2.148 ...\n\n"
    sudo wget "https://developer.nvidia.com/compute/cuda/9.2/Prod2/local_installers/cuda_9.2.148_396.37_linux"
    sudo wget "https://developer.nvidia.com/compute/cuda/9.2/Prod2/patches/1/cuda_9.2.148.1_linux"
    sudo sh cuda_9.2.148_396.37_linux
    sudo sh cuda_9.2.148.1_linux
    # Setup environment
    echo "export PATH=\$PATH:/usr/local/cuda-9.2/bin" >> ~/.profile
    echo "export LD_LIBRARY_PATH=\$LD_LIBRARY_PATH:/usr/local/cuda-9.2/lib64" >> ~/.profile
    # Remove temp files
    sudo rm -r cuda_9.2.148_396.37_linux cuda_9.2.148.1_linux
fi

# Install Heroku CLI
read -p "Do you want to install Heroku? Y/y for yes; Others for no: " ANS
if [[ $ANS == "y" || $ANS == "Y" ]]
then
    printf "\nInstall Heroku CLI ...\n\n"
    sudo add-apt-repository "deb https://cli-assets.heroku.com/branches/stable/apt ./"
    curl -L https://cli-assets.heroku.com/apt/release.key | sudo apt-key add -
    sudo apt update
    sudo apt install heroku -y
fi

# install mongoDB for Ubuntu 18.04
read -p "Do you want to install mongoDB for Ubuntu 18.04? Y/y for yes; Others for no: " ANS
if [[ $ANS == "y" || $ANS == "Y" ]]
then
    printf "\nInstall mongoDB for Ubuntu 18.04 ...\n\n"
    sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 9DA31620334BD75D9DCB49F368818C72E52529D4
    echo "deb [ arch=amd64 ] https://repo.mongodb.org/apt/ubuntu bionic/mongodb-org/4.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.0.list
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

# install Java 10
read -p "Do you want to install Java 10? Y/y for yes; Others for no: " ANS
if [[ $ANS == "y" || $ANS == "Y" ]]
then
    printf "\nInstall Java 10 ...\n\n"
    sudo add-apt-repository ppa:linuxuprising/java
    sudo apt update
    sudo apt install -y oracle-java10-installer
fi

# install Docker community version
read -p "Do you want to install Docker community version? Y/y for yes; Others for no: " ANS
if [[ $ANS == "y" || $ANS == "Y" ]]
then
    printf "\nInstall Docker community version ...\n\n"
    sudo apt install -y apt-transport-https ca-certificates software-properties-common
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

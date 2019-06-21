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

# install nodejs 12
read -p "Do you want to install nodejs 12? Y/y for yes; Others for no: " ANS
if [[ $ANS == "y" || $ANS == "Y" ]]
then
    printf "\nInstall nodejs 12 ...\n\n"
    curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
    sudo apt install -y nodejs

    # install yarn
    read -p "Do you want to install yarn? Y/y for yes; Others for no: " ANS
    if [[ $ANS == "y" || $ANS == "Y" ]]
    then
        curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
        echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
        sudo apt update && sudo apt install yarn -y
    fi

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

    read -p "Do you want to install typescript and tslint? Y/y for yes; Others for no: " ANS
    if [[ $ANS == "y" || $ANS == "Y" ]]
    then
        printf "\nInstall tslint and tsc ...\n\n"
        sudo npm install -g tslint typescript
    fi
fi

# Install golang V1.12
read -p "Do you want to install golang V1.12? Y/y for yes; Others for no: " ANS
if [[ $ANS == "y" || $ANS == "Y" ]]
then
    printf "\nInstall golang V1.12 ...\n\n"
    sudo wget "https://dl.google.com/go/go1.12.5.linux-amd64.tar.gz"
    sudo tar -C /usr/local -xzf go1.12.5.linux-amd64.tar.gz
    # Setup environment
    echo "export PATH=\$PATH:/usr/local/go/bin" >> ~/.profile
    # Remove temp files
    sudo rm -r go1.12.5.linux-amd64.tar.gz
fi

# Install CUDA V10.1
read -p "Do you want to install CUDA V10.1.105? Y/y for yes; Others for no: " ANS
if [[ $ANS == "y" || $ANS == "Y" ]]
then
    printf "\nInstall CUDA V10.1.105 ...\n\n"
    sudo wget "https://developer.nvidia.com/compute/cuda/10.1/Prod/local_installers/cuda_10.1.105_418.39_linux"
    sudo sh cuda_10.1.105_418.39_linux
    # Setup environment
    echo "export PATH=\$PATH:/usr/local/cuda-10.1/bin" >> ~/.profile
    echo "export LD_LIBRARY_PATH=\$LD_LIBRARY_PATH:/usr/local/cuda-10.1/lib64" >> ~/.profile
    # Remove temp files
    sudo rm -r cuda_10.1.105_418.39_linux
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

# install Terraform
read -p "Do you want to install Terraform V0.11.14? Y/y for yes; Others for no: " ANS
if [[ $ANS == "y" || $ANS == "Y" ]]
then
    printf "\nInstall Terraform V0.11.14 ...\n\n"
    sudo apt install -y unzip
    wget https://releases.hashicorp.com/terraform/0.11.14/terraform_0.11.14_linux_amd64.zip
    unzip terraform_0.11.14_linux_amd64.zip
    sudo mv terraform /usr/local/bin/
    sudo rm -r terraform_0.11.14_linux_amd64.zip
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

# check and install missing dependencies, cleanup ...
printf "\nCheck and install missing dependencies ...\n\n"
sudo apt install -f -y
sudo apt autoremove -y
sudo apt autoclean

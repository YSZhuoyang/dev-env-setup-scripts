#!/bin/bash
# This script is used to install packages and configure environment on Mac OS for convenience.

# install xcode cli
# printf "Install xcode cli ...\n\n"
# xcode-select --install

# install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew update
brew upgrade

# install common utils
brew install wget
pip3 install pylint yapf

# install vscode
read -p "Do you want to install vscode? Y/y for yes; Others for no: " ANS
if [[ $ANS == "y" || $ANS == "Y" ]]
then
    brew install visual-studio-code --cask
fi

# install nodejs
read -p "Do you want to install nodejs? Y/y for yes; Others for no: " ANS
if [[ $ANS == "y" || $ANS == "Y" ]]
then
    printf "\nInstall nodejs ...\n\n"
    brew install node

    # install yarn
    read -p "Do you want to install yarn? Y/y for yes; Others for no: " ANS
    if [[ $ANS == "y" || $ANS == "Y" ]]
    then
        brew install yarn
    fi

    # install npm packages
    read -p "Do you want to install create-react-app npm package? Y/y for yes; Others for no: " ANS
    if [[ $ANS == "y" || $ANS == "Y" ]]
    then
        printf "\nInstall create-react-app ...\n\n"
        npm install -g create-react-app
    fi

    read -p "Do you want to install eslint npm package? Y/y for yes; Others for no: " ANS
    if [[ $ANS == "y" || $ANS == "Y" ]]
    then
        printf "\nInstall eslint ...\n\n"
        npm install -g eslint
    fi

    read -p "Do you want to install typescript? Y/y for yes; Others for no: " ANS
    if [[ $ANS == "y" || $ANS == "Y" ]]
    then
        printf "\nInstall tsc ...\n\n"
        npm install -g typescript
    fi
fi

# Install golang
read -p "Do you want to install golang? Y/y for yes; Others for no: " ANS
if [[ $ANS == "y" || $ANS == "Y" ]]
then
    printf "\nInstall golang ...\n\n"
    brew install golang
fi

# install mongoDB
read -p "Do you want to install mongoDB? Y/y for yes; Others for no: " ANS
if [[ $ANS == "y" || $ANS == "Y" ]]
then
    printf "\nInstall mongoDB ...\n\n"
    brew tap mongodb/brew
    brew install mongodb-community
fi

# install protobuf compiler
read -p "Do you want to install protobuf compiler? Y/y for yes; Others for no: " ANS
if [[ $ANS == "y" || $ANS == "Y" ]]
then
    printf "\nInstall protobuf compiler ...\n\n"
    brew install protobuf
fi

# install Open MPI compiler
read -p "Do you want to install Open MPI compiler? Y/y for yes; Others for no: " ANS
if [[ $ANS == "y" || $ANS == "Y" ]]
then
    printf "\nInstall Open MPI compiler ...\n\n"
    brew install open-mpi
fi

# install Java
read -p "Do you want to install Java? Y/y for yes; Others for no: " ANS
if [[ $ANS == "y" || $ANS == "Y" ]]
then
    printf "\nInstall Java ...\n\n"
    brew install java --cask
fi

# install .Net Core
read -p "Do you want to install .Net Core? Y/y for yes; Others for no: " ANS
if [[ $ANS == "y" || $ANS == "Y" ]]
then
    printf "\nInstall .Net Core ...\n\n"
    brew install dotnet-sdk --cask
fi

read -p "Do you want to install Virtualbox? Y/y for yes; Others for no: " ANS
if [[ $ANS == "y" || $ANS == "Y" ]]
then
    printf "\nInstall Virtualbox ...\n\n"
    brew install virtualbox --cask
fi

# install Docker desktop
read -p "Do you want to install Docker desktop? Y/y for yes; Others for no: " ANS
if [[ $ANS == "y" || $ANS == "Y" ]]
then
    printf "\nInstall Docker desktop ...\n\n"
    brew install docker --cask

    read -p "Do you want to install kubectl? Y/y for yes; Others for no: " ANS
    if [[ $ANS == "y" || $ANS == "Y" ]]
    then
        printf "\nInstall kubectl ...\n\n"
        brew install kubectl

        read -p "Do you want to install helm? Y/y for yes; Others for no: " ANS
        if [[ $ANS == "y" || $ANS == "Y" ]]
        then
            printf "\nInstall helm ...\n\n"
            brew install helm
            helm repo add stable https://charts.helm.sh/stable
        fi
    fi
fi

# install Terraform
read -p "Do you want to install Terraform? Y/y for yes; Others for no: " ANS
if [[ $ANS == "y" || $ANS == "Y" ]]
then
    printf "\nInstall Terraform ...\n\n"
    brew install terraform
fi

# install Ansible
read -p "Do you want to install Ansible? Y/y for yes; Others for no: " ANS
if [[ $ANS == "y" || $ANS == "Y" ]]
then
    printf "\nInstall Ansible ...\n\n"
    brew install ansible
fi

# check and install missing dependencies, cleanup ...
printf "\nCleanup ...\n\n"
brew cleanup

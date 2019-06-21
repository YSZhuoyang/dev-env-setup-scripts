#!/bin/bash
# This script is used to install packages and configure environment on Ubuntu for convenience.

# install common used apt packages and update system packages
printf "Install common used apt packages and update built-in packages ...\n\n"
xcode-select --install

# install homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew update
brew upgrade

# install vscode
read -p "Do you want to install vscode? Y/y for yes; Others for no: " ANS
if [[ $ANS == "y" || $ANS == "Y" ]]
then
    brew cask install visual-studio-code
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

    read -p "Do you want to install typescript and tslint? Y/y for yes; Others for no: " ANS
    if [[ $ANS == "y" || $ANS == "Y" ]]
    then
        printf "\nInstall tslint and tsc ...\n\n"
        npm install -g tslint typescript
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
    brew cask install java
fi

# install Docker community version
read -p "Do you want to install Docker community version? Y/y for yes; Others for no: " ANS
if [[ $ANS == "y" || $ANS == "Y" ]]
then
    printf "\nInstall Docker community version ...\n\n"
    brew cask install docker
    printf "\nInstall Virtualbox driver for docker-machine ...\n\n"
    brew cask install virtualbox
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

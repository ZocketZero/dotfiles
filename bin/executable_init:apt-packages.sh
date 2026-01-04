#!/bin/bash

packages=(
    git
    fastfetch 
    curl
    wget
    gh
    glab
    7zip
    resolvconf
    zsh
    fonts-firacode
    fonts-thai-tlwg
    bibata-cursor-theme
    papirus-icon-theme
)

# loop to install packages with apt
echo "installing packages from apt (y/N)"
read na
if [ "$na" == "Y" ] || [ "$na" == "y" ]
then
    sudo apt install "${packages[@]}"
fi


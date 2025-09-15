#!/usr/bin/env bash

SCRIPT_DIR=$(dirname "${BASH_SOURCE[0]}")
source "$SCRIPT_DIR/common-functions.sh"

mkdir ~/tmp
pushd ~/tmp

sudo apt update
sudo apt install ttf-mscorefonts-installer -y

snap remove --purge libreoffice
#sudo apt autoremove libreoffice* -y
flatpak uninstall org.libreoffice.LibreOffice -y
sudo apt-get autoremove onlyoffice-desktopeditors -y

#sudo snap install libreoffice -y # slow
sudo apt install libreoffice -y # late version
#flatpak install org.libreoffice.LibreOffice -y # missing fr
#install_onlyoffice

popd
rm -rf ~/tmp

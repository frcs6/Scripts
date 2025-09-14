#!/usr/bin/env bash

SCRIPT_DIR=$(dirname "${BASH_SOURCE[0]}")
source "$SCRIPT_DIR/common-functions.sh"

mkdir ~/tmp
pushd ~/tmp

#snap remove --purge libreoffice
#sudo apt autoremove libreoffice* -y

#flatpak install org.libreoffice.LibreOffice -y
#install_onlyoffice
sudo snap install libreoffice -y
#sudo apt install libreoffice -y

popd
rm -rf ~/tmp

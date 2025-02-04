#!/usr/bin/env bash

SCRIPT_DIR=$(dirname "${BASH_SOURCE[0]}")
source "$SCRIPT_DIR/common-functions.sh"

replace_libreoffice() {
    sudo apt autoremove libreoffice* -y
    flatpak install flathub org.onlyoffice.desktopeditors -y
}

mkdir ~/tmp
pushd ~/tmp

sudo apt update

install_google_chrome
install_insync nemo
install_base_softwares
install_spotify

#replace_libreoffice
#sudo apt install dropbox nemo-dropbox -y
#install_asus_camera
#install_yoga_drivers
#install_games

sudo apt autoremove thunderbird* mintchat* -y

install_base_flatpaks

popd
rm -rf ~/tmp

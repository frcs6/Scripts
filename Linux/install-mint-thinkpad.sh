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
install_spotify

sudo apt install ubuntu-restricted-addons -y
sudo apt install samba -y
sudo apt install keepassxc -y
#sudo apt install papirus-icon-theme -y

replace_libreoffice

sudo apt autoremove thunderbird* mintchat* -y

flatpak install flathub com.github.tchx84.Flatseal -y

popd
rm -rf ~/tmp

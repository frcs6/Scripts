#!/usr/bin/env bash

SCRIPT_DIR=$(dirname "${BASH_SOURCE[0]}")
source "$SCRIPT_DIR/common-functions.sh"

mkdir ~/tmp
pushd ~/tmp

sudo apt update

install_google_chrome
install_spotify
install_yoga_drivers

sudo apt install ubuntu-restricted-addons -y
sudo apt install samba -y
sudo apt install dropbox nemo-dropbox -y

sudo apt autoremove thunderbird* mintchat* -y

flatpak install flathub com.github.tchx84.Flatseal -y

popd
rm -rf ~/tmp

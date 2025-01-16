#!/usr/bin/env bash

SCRIPT_DIR=$(dirname "${BASH_SOURCE[0]}")
source "$SCRIPT_DIR/common-functions.sh"

mkdir ~/tmp
pushd ~/tmp

sudo apt update

install_google_chrome
install_insync nemo
install_base_softwares
install_spotify
#install_asus_camera
#install_yoga_drivers

#sudo apt install dropbox nemo-dropbox -y
sudo apt autoremove firefox* thunderbird* mintchat*

install_base_flatpaks

popd
rm -rf ~/tmp

#!/usr/bin/env bash

SCRIPT_DIR=$(dirname "${BASH_SOURCE[0]}")
source "$SCRIPT_DIR/common-functions.sh"

mkdir ~/tmp
pushd ~/tmp

echo "snap" >> ~/.hidden

sudo apt update

# Software & Utilities (apt)
sudo apt install file-roller -y
sudo apt install gnome-tweaks -y
sudo apt install gnome-shell-extension-alphabetical-grid -y
sudo apt install gnome-shell-extension-prefs -y
sudo apt install gnome-shell-extensions -y
#sudo apt install inkscape -y
sudo apt install libfuse2t64 -y
sudo apt install samba -y
sudo apt install timeshift -y
sudo apt install ttf-mscorefonts-installer -y
sudo apt install ubuntu-restricted-addons -y

# Software & Utilities (snap)
#sudo snap install blender --classic
#sudo snap install --classic code
#sudo snap install keepassxc -y
sudo snap install spotify -y
sudo snap install vlc -y

# Google Chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install ./google-chrome-stable_current_amd64.deb -y

popd
rm -rf ~/tmp

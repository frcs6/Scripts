#!/usr/bin/env bash

SCRIPT_DIR=$(dirname "${BASH_SOURCE[0]}")
source "$SCRIPT_DIR/common-functions.sh"

configure_flatpak() {
    sudo apt install flatpak gnome-software-plugin-flatpak -y
    flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
    snap remove --purge snap-store
}

mkdir ~/tmp
pushd ~/tmp

sudo apt update

install_google_chrome
install_insync nautilus
#install_dropbox
install_base_softwares

snap install spotify
snap remove --purge firefox snap-store thunderbird libreoffice
echo "snap" >> ~/.hidden

sudo apt install gnome-tweaks -y
sudo apt install gnome-shell-extension-alphabetical-grid -y
sudo apt install gnome-shell-extension-prefs -y
sudo apt install gnome-shell-extensions -y
sudo apt install timeshift -y
sudo apt install libreoffice -y
sudo apt install file-roller -y

#configure_flatpak # Need logout
#install_base_flatpaks

popd
rm -rf ~/tmp

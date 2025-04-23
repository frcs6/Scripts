#!/usr/bin/env bash

SCRIPT_DIR=$(dirname "${BASH_SOURCE[0]}")
source "$SCRIPT_DIR/common-functions.sh"

configure_flatpak() {
    sudo apt install flatpak gnome-software-plugin-flatpak -y
    flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
    snap remove --purge snap-store
}

install_dropbox() {
    wget -O dropbox.deb https://www.dropbox.com/download?dl=packages/ubuntu/dropbox_2024.04.17_amd64.deb
    sudo apt install ./dropbox.deb -y
}

mkdir ~/tmp
pushd ~/tmp

sudo apt update

install_google_chrome
install_insync nautilus
install_base_softwares
snap install spotify

#install_dropbox
#install_asus_camera
#install_yoga_drivers
#install_games

snap remove --purge thunderbird

echo "snap" >> ~/.hidden

sudo apt install gnome-tweaks -y
sudo apt install gnome-shell-extension-alphabetical-grid -y
sudo apt install gnome-shell-extension-prefs -y
sudo apt install gnome-shell-extensions -y
sudo apt install timeshift -y
sudo apt install file-roller -y

#configure_flatpak # Need logout

popd
rm -rf ~/tmp

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

echo "snap" >> ~/.hidden

sudo apt update

install_google_chrome

sudo snap install spotify

sudo apt install ubuntu-restricted-addons -y
sudo apt install samba -y
sudo apt install libfuse2t64 -y
sudo apt install gnome-tweaks -y
sudo apt install gnome-shell-extension-alphabetical-grid -y
sudo apt install gnome-shell-extension-prefs -y
sudo apt install gnome-shell-extensions -y
sudo apt install timeshift -y
sudo apt install file-roller -y
sudo apt install inkscape -y
# sudo apt install homebank -y

# sudo snap install --classic code
# sudo add-apt-repository ppa:dotnet/backports
# sudo apt update
# sudo apt install dotnet-sdk-8.0 -y
# sudo apt install dotnet-sdk-9.0 -y

sudo apt install papirus-icon-theme -y
snap install icon-theme-papirus

snap remove --purge thunderbird

# configure_flatpak # Need logout

remove_libreoffice
install_onlyoffice

popd
rm -rf ~/tmp

#!/usr/bin/env bash

SCRIPT_DIR=$(dirname "${BASH_SOURCE[0]}")
source "$SCRIPT_DIR/common-functions.sh"

replace_libreoffice() {
    snap remove --purge libreoffice
    sudo apt autoremove libreoffice* -y
    flatpak install flathub org.onlyoffice.desktopeditors -y
}

mkdir ~/tmp
pushd ~/tmp

sudo apt update

flatpak install com.github.tchx84.Flatseal -y
flatpak install org.keepassxc.KeePassXC -y
flatpak install org.gimp.GIMP -y
# replace_libreoffice

popd
rm -rf ~/tmp

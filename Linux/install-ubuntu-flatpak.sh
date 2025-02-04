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

install_base_flatpaks
replace_libreoffice

popd
rm -rf ~/tmp

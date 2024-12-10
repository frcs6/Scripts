#!/usr/bin/env bash

install_google_chrome() {
    wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
    sudo apt install ./google-chrome-stable_current_amd64.deb -y
}

install_yoga_drivers() {
    sudo apt install build-essential dkms git iw -y
    mkdir ~/Drivers
    pushd ~/Drivers
    git clone https://github.com/morrownr/8821au-20210708.git
    pushd ./8821au-20210708
    sudo ./install-driver.sh
    popd
    popd
}

install_softwares() {
    sudo apt install ubuntu-restricted-addons samba dropbox nemo-dropbox spotify-client keepassxc -y
    flatpak install com.github.tchx84.Flatseal -y
}

cleanup_software() {
    sudo apt autoremove firefox* thunderbird* mintchat*
}

mkdir ~/tmp
pushd ~/tmp

#sudo apt update
#install_google_chrome
#install_yoga_drivers
#install_softwares
#cleanup_software

popd
rm -rf ~/tmp

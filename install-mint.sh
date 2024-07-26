#!/usr/bin/env bash

install_google_chrome() {
    wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
    sudo apt install ./google-chrome-stable_current_amd64.deb -y
}

install_dropbox() {
    wget -O dropbox.deb https://www.dropbox.com/download?dl=packages/ubuntu/dropbox_2024.04.17_amd64.deb
    sudo apt install ./dropbox.deb -y
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
    sudo apt install ubuntu-restricted-addons samba -y
    
    #snap install spotify jdownloader2
    
    flatpak install flathub org.keepassxc.KeePassXC flathub com.github.tchx84.Flatseal -y
}

cleanup_software() {
    sudo apt autoremove firefox* thunderbird*
}

configure_others() {
    echo "snap" >> ~/.hidden
}

mkdir ~/tmp
pushd ~/tmp

#sudo apt update
#install_google_chrome
#install_flatpak
#install_yoga_drivers
#install_dropbox
#install_softwares
#cleanup_software
#configure_others

popd
rm -rf ~/tmp

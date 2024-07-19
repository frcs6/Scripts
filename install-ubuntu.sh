#!/usr/bin/env bash

install_google_chrome() {
    wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
    sudo apt install ./google-chrome-stable_current_amd64.deb -y
}

install_dropbox() {
    wget -O dropbox.deb https://www.dropbox.com/download?dl=packages/ubuntu/dropbox_2024.04.17_amd64.deb
    sudo apt install ./dropbox.deb -y
}

install_flatpak() {
    sudo apt install flatpak gnome-software-plugin-flatpak -y
    flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
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
    sudo apt autoremove gnome-snapshot -y
    sudo apt install ubuntu-restricted-addons gnome-tweaks gnome-shell-extension-alphabetical-grid gnome-shell-extension-manager gnome-shell-extension-prefs gnome-shell-extensions timeshift samba cheese papirus-icon-theme -y
    
    snap install spotify jdownloader2
    
    flatpak install flathub org.keepassxc.KeePassXC flathub com.github.tchx84.Flatseal -y
}

cleanup_software() {
    snap remove --purge firefox snap-store thunderbird
}

configure_gnome() {
    'snap' >> ~/.hidden
}

mkdir ~/tmp
pushd ~/tmp

sudo apt update
#install_google_chrome
#install_flatpak
#install_yoga_drivers
#install_dropbox
#install_softwares
#cleanup_software
#configure_gnome

popd
rm -rf ~/tmp

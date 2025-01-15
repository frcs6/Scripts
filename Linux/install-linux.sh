#!/usr/bin/env bash

configure_flatpak() {
    sudo apt install flatpak gnome-software-plugin-flatpak -y
    flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
    snap remove --purge snap-store
}

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
    sudo apt install ubuntu-restricted-addons -y
    sudo apt install samba -y
    sudo apt install keepassxc -y
    sudo apt install papirus-icon-theme -y
}

install_flatpaks()
{
    flatpak install com.github.tchx84.Flatseal -y
}

install_insync_ubuntu()
{
    wget https://cdn.insynchq.com/builds/linux/3.9.4.60020/insync_3.9.4.60020-noble_amd64.deb
    sudo apt install ./insync_3.9.4.60020-noble_amd64.deb -y

    wget https://cdn.insynchq.com/builds/linux/3.8.2.50468/insync-nautilus_3.8.2.50468_all.deb
    sudo apt install ./insync-nautilus_3.8.2.50468_all.deb -y
}

install_insync_mint()
{
    wget https://cdn.insynchq.com/builds/linux/3.9.4.60020/insync_3.9.4.60020-noble_amd64.deb
    sudo apt install ./insync_3.9.4.60020-noble_amd64.deb -y

    wget https://cdn.insynchq.com/builds/linux/3.7.9.50368/insync-nemo_3.7.9.50368_all.deb
    sudo apt install ./insync-nemo_3.7.9.50368_all.deb -y
}

mint()
{
    install_google_chrome
    #sudo apt install dropbox nemo-dropbox -y
    install_softwares
    install_insync_mint    
    sudo apt install spotify-client -y
    sudo apt autoremove firefox* thunderbird* mintchat*
    install_flatpaks
}

ubuntu()
{
    install_google_chrome
    #install_dropbox
    install_softwares
    #configure_flatpak # Need logout
    #install_flatpaks
    install_insync_ubuntu
    snap install spotify
    snap remove --purge firefox snap-store thunderbird libreoffice
    sudo apt install gnome-tweaks -y
    sudo apt install gnome-shell-extension-alphabetical-grid -y
    sudo apt install gnome-shell-extension-prefs -y
    sudo apt install gnome-shell-extensions -y
    sudo apt install timeshift -y
    sudo apt install libreoffice -y
    sudo apt install file-roller -y
    echo "snap" >> ~/.hidden
}

mkdir ~/tmp
pushd ~/tmp

#sudo apt update
#mint
#ubuntu

popd
rm -rf ~/tmp

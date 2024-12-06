#!/usr/bin/env bash

install_dropbox() {
    wget -O dropbox.rpm https://www.dropbox.com/download?dl=packages/fedora/nautilus-dropbox-2024.04.17-1.fc39.x86_64.rpm
    dnf install ./dropbox.rpm -y
}

dnf_config() {
    if [[ $(grep -c 'max_parallel_downloads=' /etc/dnf/dnf.conf) -lt 1 ]]
    then
        echo "max_parallel_downloads=10" >> /etc/dnf/dnf.conf
    fi
    if [[ $(grep -c 'countme=' /etc/dnf/dnf.conf) -lt 1 ]]
    then
        echo "countme=false" >> /etc/dnf/dnf.conf
    fi
    if [[ $(grep -c 'deltarpm=' /etc/dnf/dnf.conf) -lt 1 ]]
    then
        echo "deltarpm=false" >> /etc/dnf/dnf.conf
    fi
}

clean_repos() {
    rm -f /etc/yum.repos.d/_copr:copr.fedorainfracloud.org:phracek:PyCharm.repo
}

rpm_fusion() {
    dnf install -y https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
}

install_softwares() {
    dnf swap -y "ffmpeg-free" "ffmpeg" --allowerasing
    dnf install -y gstreamer1-plugins-base
    dnf install -y gstreamer1-plugins-good
    dnf install -y gstreamer1-plugins-bad-free
    dnf install -y gstreamer1-plugins-good-extras
    dnf install -y gstreamer1-plugins-bad-free-extras
    dnf install -y gstreamer1-plugins-ugly-free
    dnf install -y gstreamer1-plugin-libav
    dnf install -y gstreamer1-plugins-ugly
    dnf install -y gstreamer1-plugin-openh264
    dnf install -y gnome-extensions-app
    dnf install -y gnome-shell-extension-dash-to-dock
    dnf install -y gnome-shell-extension-appindicator
    dnf install -y gnome-shell-extension-user-theme
    dnf install -y gnome-tweaks
    dnf install -y file-roller
    dnf install -y keepassxc
    dnf install -y timeshift
    flatpak install com.github.tchx84.Flatseal -y
}

cleanup_software() {
    dnf remove firefox
}

install_yoga_drivers() {
    dnf -y install git dkms kernel-devel
    mkdir ~/Drivers
    pushd ~/Drivers
    git clone https://github.com/morrownr/8821au-20210708.git
    pushd ./8821au-20210708
    ./install-driver.sh
    popd
    popd
}

mkdir ~/tmp
pushd ~/tmp

#dnf_config
#clean_repos
#rpm_fusion
#install_softwares
#cleanup_software
#install_dropbox
#install_yoga_drivers

popd
rm -rf ~/tmp

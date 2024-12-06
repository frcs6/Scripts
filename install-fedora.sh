#!/usr/bin/env bash

install_google_chrome() {
    echo "[google-chrome]
	name=google-chrome
	baseurl=https://dl.google.com/linux/chrome/rpm/stable/x86_64
	enabled=1
	gpgcheck=1
	gpgkey=https://dl.google.com/linux/linux_signing_key.pub" 2>/dev/null > /etc/yum.repos.d/google-chrome.repo
	sed -e 's/\t//g' -i /etc/yum.repos.d/google-chrome.repo
    dnf install google-chrome-stable -y
}

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
    rm -f /etc/yum.repos.d/google-chrome.repo
}

rpm_fusion() {
    sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
    sudo dnf config-manager setopt fedora-cisco-openh264.enabled=1
}

install_softwares() {
    dnf swap -y "ffmpeg-free" "ffmpeg" --allowerasing
    dnf install -y gstreamer1-plugins-base gstreamer1-plugins-good gstreamer1-plugins-bad-free gstreamer1-plugins-good-extras gstreamer1-plugins-bad-free-extras gstreamer1-plugins-ugly-free gstreamer1-plugin-libav gstreamer1-plugins-ugly libdvdcss gstreamer1-plugin-openh264
    dnf install -y adwaita-qt5 adwaita-qt6
    dnf install -y gnome-extensions-app gnome-shell-extension-dash-to-dock gnome-shell-extension-appindicator gnome-shell-extension-user-theme
    dnf install -y gnome-tweaks file-roller git keepassxc timeshift
    flatpak install com.github.tchx84.Flatseal -y
}

cleanup_software() {
    dnf remove firefox
}

install_yoga_drivers() {
    sudo dnf -y install git dkms kernel-devel
    mkdir ~/Drivers
    pushd ~/Drivers
    git clone https://github.com/morrownr/8821au-20210708.git
    pushd ./8821au-20210708
    sudo ./install-driver.sh
    popd
    popd
}

mkdir ~/tmp
pushd ~/tmp

#dnf_config
#clean_repos
#install_google_chrome
#rpm_fusion
#install_softwares
#cleanup_software
#install_dropbox
#install_yoga_drivers

popd
rm -rf ~/tmp

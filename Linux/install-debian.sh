#!/usr/bin/env bash

SCRIPT_DIR=$(dirname "${BASH_SOURCE[0]}")
source "$SCRIPT_DIR/common-functions.sh"

if ! command -v apt >/dev/null 2>&1; then
    echo "apt n'est pas disponible — script ignoré."
    exit 0
fi

# touch ~/.hidden
# grep -qx "snap" ~/.hidden || echo "snap" >> ~/.hidden

# apt_install flatpak
# apt_install snapd
# apt_install gnome-software
# apt_install gnome-software-plugin-flatpak
# apt_install gnome-software-plugin-snap

# sudo flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

sudo apt update
sudo apt full-upgrade -y
if command -v snap >/dev/null 2>&1; then
    sudo snap refresh
fi
if command -v flatpak >/dev/null 2>&1; then
    flatpak update -y
fi

# Dans .profile
# PATH="$PATH:/usr/sbin:/sbin"

# Dans /etc/apt/sources.list
# main contrib non-free non-free-firmware

apt_install gnome-shell-extensions
apt_install gnome-shell-extension-appindicator
apt_install gnome-shell-extension-caffeine
apt_install gnome-shell-extension-dashtodock
apt_install gnome-shell-extension-desktop-icons-ng
apt_install gnome-shell-extension-tiling-assistant
apt_install gnome-tweaks

apt_install curl
apt_install gamemode
apt_install libreoffice
apt_install libfuse2t64
apt_install timeshift
apt_install ttf-mscorefonts-installer
apt_install vlc
apt_install wget

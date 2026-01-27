#!/usr/bin/env bash

SCRIPT_DIR=$(dirname "${BASH_SOURCE[0]}")
source "$SCRIPT_DIR/common-functions.sh"

sudo apt update
sudo apt full-upgrade -y
if command -v snap >/dev/null 2>&1; then
    sudo snap refresh
fi
if command -v flatpak >/dev/null 2>&1; then
    flatpak update -y
fi

apt_install curl
apt_install libfuse2t64
apt_install samba
apt_install spotify-client
apt_install ttf-mscorefonts-installer
apt_install ubuntu-restricted-addons
apt_install ubuntu-restricted-extras
apt_install wget
apt_install gstreamer1.0-plugins-base
apt_install gstreamer1.0-plugins-good
apt_install gstreamer1.0-plugins-bad
apt_install gstreamer1.0-plugins-ugly
apt_install gstreamer1.0-libav
apt_install vlc
install_google_chrome
flatpak_install org.keepassxc.KeePassXC

# Nettoyage final
sudo apt autoremove --purge -y
sudo apt autopurge -y
sudo apt autoremove -y
if command -v flatpak >/dev/null 2>&1; then
    flatpak uninstall --unused -y
fi

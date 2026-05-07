#!/usr/bin/env bash

SCRIPT_DIR=$(dirname "${BASH_SOURCE[0]}")
source "$SCRIPT_DIR/../Shared/common-functions.sh"

if ! command -v apt >/dev/null 2>&1; then
    echo "Not a Debian-based system..."
    exit 0
fi

sudo apt update
sudo apt full-upgrade -y
if command -v snap >/dev/null 2>&1; then
    sudo snap refresh
fi
if command -v flatpak >/dev/null 2>&1; then
    flatpak update -y
fi

if is_gnome; then
    echo "Ubuntu"
    apt_install file-roller
    apt_install gnome-calendar
    apt_install gnome-contacts
    apt_install gnome-maps
    apt_install gnome-shell-extension-alphabetical-grid
    apt_install gnome-shell-extensions
    apt_install gnome-tweaks
    apt_install gnome-weather
    apt_install gufw
elif is_kde; then
    echo "Kubuntu"
elif is_cinnamon; then
    echo "Linux Mint Cinnamon"
elif is_xfce; then
    echo "Xubuntu"
fi

apt_install curl
apt_install ffmpeg
apt_install libfuse2t64
apt_install libreoffice
apt_install libreoffice-grammalecte
# apt_install papirus-icon-theme
# snap_instal icon-theme-papirus
apt_install timeshift
apt_install ubuntu-restricted-extras
apt_install unrar
apt_install vlc
apt_install wget

install_google_chrome

snap_remove thunderbird

sudo apt autoremove --purge -y
if command -v flatpak >/dev/null 2>&1; then
    flatpak uninstall --unused -y
fi

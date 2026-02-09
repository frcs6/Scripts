#!/usr/bin/env bash

SCRIPT_DIR=$(dirname "${BASH_SOURCE[0]}")
source "$SCRIPT_DIR/common-functions.sh"

if ! command -v apt >/dev/null 2>&1; then
    echo "apt n'est pas disponible — script ignoré."
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

if is_ubuntu; then
    echo "Ubuntu"
    apt_install file-roller
    apt_install gnome-calendar
    apt_install gnome-contacts
    apt_install gnome-games
    apt_install gnome-maps
    apt_install gnome-shell-extension-alphabetical-grid
    apt_install gnome-shell-extension-prefs
    apt_install gnome-shell-extensions
    apt_install gnome-tweaks
    apt_install gnome-weather
    apt_install gufw
    snap_install spotify
elif is_kubuntu; then
    echo "Kubuntu"
    apt_install kdegames
    apt_install marble
    snap_install spotify
elif is_mint_cinnamon; then
    echo "Linux Mint Cinnamon"
    apt_install spotify-client
fi

apt_install libreoffice
apt_install curl
apt_install libfuse2t64
apt_install samba
apt_install timeshift
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
apt_install papirus-icon-theme
snap_install icon-theme-papirus

# Nettoyage final
sudo apt autoremove --purge -y
sudo apt autopurge -y
sudo apt autoremove -y
if command -v flatpak >/dev/null 2>&1; then
    flatpak uninstall --unused -y
fi

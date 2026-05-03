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
    apt_install gnome-maps
    apt_install gnome-shell-extension-alphabetical-grid
    apt_install gnome-shell-extensions
    apt_install gnome-tweaks
    apt_install gnome-weather
    apt_install gufw
    snap_install spotify
elif is_kubuntu; then
    echo "Kubuntu"
    snap_install spotify
elif is_mint_cinnamon; then
    echo "Linux Mint Cinnamon"
    apt_install spotify-client
fi

apt_install curl
apt_install libfuse2t64
apt_install libreoffice
# apt_install papirus-icon-theme
# snap_instal icon-theme-papirus
apt_install timeshift
apt_install ubuntu-restricted-extras
apt_install vlc

install_google_chrome

snap_remove thunderbird

flatpak_install de.swsnr.pictureoftheday
flatpak_install org.gimp.GIMP
flatpak_install org.inkscape.Inkscape
flatpak_install org.kde.krita
flatpak_install org.keepassxc.KeePassXC
flatpak_install com.github.PintaProject.Pinta
flatpak_install com.github.tchx84.Flatseal
# flatpak_install com.vysp3r.ProtonPlus

# Nettoyage final
sudo apt autoremove --purge -y
if command -v flatpak >/dev/null 2>&1; then
    flatpak uninstall --unused -y
fi

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
    echo "Debian Gnome"
    apt_install gnome-shell-extensions
    apt_install gnome-shell-extension-appindicator
    apt_install gnome-shell-extension-caffeine
    apt_install gnome-shell-extension-dashtodock
    apt_install gnome-shell-extension-desktop-icons-ng
    apt_install gnome-shell-extension-tiling-assistant
    apt_install gnome-tweaks
    apt_install gufw
elif is_cinnamon; then
    echo "LMDE"
fi

apt_install curl
apt_install ffmpeg
apt_install gamemode
apt_install libreoffice
apt_install libreoffice-grammalecte
apt_install libfuse2t64
# apt_install papirus-icon-theme
# snap_instal icon-theme-papirus
apt_install timeshift
apt_install ttf-mscorefonts-installer
apt_install unrar
apt_install wget

# apt_install libreoffice-l10n-fr
# apt_install libreoffice-help-fr
# apt_install hunspell-fr
# apt_install firefox-l10n-fr

install_google_chrome

apt_remove evolution

# Nettoyage final
sudo apt autoremove --purge -y
if command -v flatpak >/dev/null 2>&1; then
    flatpak uninstall --unused -y
fi

#!/usr/bin/env bash

SCRIPT_DIR=$(dirname "${BASH_SOURCE[0]}")
source "$SCRIPT_DIR/common-functions.sh"

if ! is_debian; then
    echo "Ce script ne s'exécute que sur Debian ou ses dérivés. Arrêt." >&2
    exit 1
fi

sudo apt update
sudo apt full-upgrade -y
if command -v snap >/dev/null 2>&1; then
    sudo snap refresh
fi
if command -v flatpak >/dev/null 2>&1; then
    sudo flatpak update -y
fi

apt_install firmware-linux 
apt_install firmware-linux-nonfree 
apt_install firmware-amd-graphics

apt_install file-roller
apt_install gnome-calendar
apt_install gnome-contacts
apt_install gnome-games
apt_install gnome-maps
#apt_install gnome-shell-extension-alphabetical-grid
#apt_install gnome-shell-extension-prefs
#apt_install gnome-shell-extensions
apt_install gnome-tweaks
apt_install gnome-weather

apt_install libfuse2t
apt_install samba
apt_install timeshift
apt_install ttf-mscorefonts-installer
apt_install wget
apt_install gstreamer1.0-plugins-bad
apt_install gstreamer1.0-libav
apt_install libdvd-pkg
apt_install p7zip-full
apt_install unrar
apt_install vlc

apt_install hunspell-en-ca
apt_install hunspell-en-us
apt_install hunspell-fr
apt_install hyphen-en-ca
apt_install hyphen-en-us
apt_install hyphen-fr
apt_install libreoffice-help-en-us
apt_install libreoffice-help-fr
apt_install libreoffice-l10n-fr
apt_install mythes-en-us
apt_install mythes-fr
apt_install aspell-en
apt_install aspell-fr
apt_install wamerican
apt_install wcanadian
apt_install wfrench

snap_install spotify

flatpak_install org.keepassxc.KeePassXC

install_google_chrome

if command -v apt >/dev/null 2>&1; then
    sudo apt autoremove --purge -y
    sudo apt autoremove -y
fi
if command -v flatpak >/dev/null 2>&1; then
    flatpak uninstall --unused -y
fi

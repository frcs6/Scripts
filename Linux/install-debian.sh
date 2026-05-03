#!/usr/bin/env bash

# Dans .profile
# PATH="$PATH:/usr/sbin:/sbin"

# Dans /etc/apt/sources.list
# main contrib non-free non-free-firmware

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

apt_install gnome-shell-extensions
apt_install gnome-shell-extension-appindicator
apt_install gnome-shell-extension-caffeine
apt_install gnome-shell-extension-dashtodock
apt_install gnome-shell-extension-desktop-icons-ng
apt_install gnome-shell-extension-tiling-assistant
apt_install gnome-tweaks
apt_install gufw

apt_install curl
apt_install ffmpeg
apt_install gamemode
apt_install libreoffice
apt_install libfuse2t64
# apt_install papirus-icon-theme
apt_install timeshift
apt_install ttf-mscorefonts-installer
apt_install unrar
apt_install vlc
apt_install wget

# apt_install libreoffice-l10n-fr
# apt_install libreoffice-help-fr
# apt_install hunspell-fr
# apt_install firefox-l10n-fr

install_google_chrome

apt_remove evolution

snap_install spotify

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

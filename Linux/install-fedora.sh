#!/usr/bin/env bash

SCRIPT_DIR=$(dirname "${BASH_SOURCE[0]}")
source "$SCRIPT_DIR/common-functions.sh"

if ! command -v dnf >/dev/null 2>&1; then
    echo "dnf n'est pas disponible — script ignoré."
    exit 0
fi

sudo dnf upgrade -y    
flatpak update -y

dnf_install file-roller
dnf_install file-roller-nautilus
dnf_install gnome-extensions-app
dnf_install gnome-shell-extension-appindicator
dnf_install gnome-shell-extension-dash-to-dock
dnf_install gnome-shell-extension-system-monitor
dnf_install gnome-tweaks
dnf_install firewall-config
dnf_install fuse
dnf_install fuse-libs
dnf_install fuse3-libs
dnf_install google-chrome-stable
dnf_install libreoffice
dnf_install samba
dnf_install timeshift
dnf_install vlc
dnf_install wget2
dnf_install gamemode
dnf_install gstreamer1-plugin-libav
dnf_install gstreamer1-plugins-base
dnf_install gstreamer1-plugins-good
dnf_install gstreamer1-plugins-bad-free
dnf_install gstreamer1-plugins-ugly-free
#dnf_install gstreamer1-plugins-bad-freeworld
#dnf_install gstreamer1-plugins-ugly 
dnf_install langpacks-fr
dnf_install papirus-icon-theme-dark
dnf_install papirus-icon-theme-light
dnf_install libreoffice-icon-theme-papirus
dnf_install java-25-openjdk

flatpak_install com.spotify.Client
flatpak_install org.keepassxc.KeePassXC

# Nettoyage final
sudo dnf autoremove -y
sudo dnf clean all
flatpak uninstall --unused -y
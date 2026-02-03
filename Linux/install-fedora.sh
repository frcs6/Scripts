#!/usr/bin/env bash

SCRIPT_DIR=$(dirname "${BASH_SOURCE[0]}")
source "$SCRIPT_DIR/common-functions.sh"

if ! command -v dnf >/dev/null 2>&1; then
    echo "dnf n'est pas disponible — script ignoré."
    exit 0
fi

sudo dnf upgrade -y    
if ! rpm -q rpmfusion-free-release >/dev/null 2>&1; then
    sudo dnf copr disable phracek/PyCharm
    sudo dnf config-manager setopt rpmfusion-nonfree-steam.enabled=0
    sudo dnf config-manager setopt rpmfusion-nonfree-nvidia-driver.enabled=0

    sudo dnf install \
        https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
        https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y

    sudo dnf update -y
fi

flatpak update -y

dnf_install file-roller
dnf_install file-roller-nautilus
dnf_install gnome-calendar
dnf_install gnome-contacts
dnf_install gnome-maps
dnf_install gnome-extensions-app
dnf_install gnome-shell-extension-appindicator
dnf_install gnome-shell-extension-blur-my-shell
dnf_install gnome-shell-extension-caffeine
dnf_install gnome-shell-extension-dash-to-dock
dnf_install gnome-shell-extension-system-monitor
dnf_install gnome-shell-extension-user-theme
dnf_install gnome-tweaks
dnf_install gnome-weather

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
dnf_install gstreamer1-plugins-bad-freeworld
dnf_install gstreamer1-plugins-ugly 

dnf_install langpacks-fr 
dnf_install hunspell-fr 
dnf_install hyphen-fr 
dnf_install mythes-fr 
dnf_install libreoffice-langpack-fr 
dnf_install libreoffice-help-fr 
dnf_install glibc-langpack-fr

dnf_install papirus-icon-theme-dark
dnf_install papirus-icon-theme-light
dnf_install libreoffice-icon-theme-papirus

flatpak_install com.spotify.Client
flatpak_install org.keepassxc.KeePassXC

# Nettoyage final
sudo dnf autoremove -y
sudo dnf clean all
flatpak uninstall --unused -y

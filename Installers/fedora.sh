#!/usr/bin/env bash

SCRIPT_DIR=$(dirname "${BASH_SOURCE[0]}")
source "$SCRIPT_DIR/../Shared/common-functions.sh"

if ! command -v dnf >/dev/null 2>&1; then
    echo "Not a Fedora-based system..."
    exit 0
fi

sudo dnf upgrade -y  
flatpak update -y

if is_gnome; then
    echo "Fedora Gnome"
    dnf_install file-roller
    dnf_install file-roller-nautilus
    dnf_install gnome-extensions-app
    # dnf_install gnome-shell-extension-caffeine
    # dnf_install gnome-shell-extension-gamemode
    dnf_install gnome-shell-extension-appindicator
    dnf_install gnome-shell-extension-dash-to-dock
    dnf_install gnome-shell-extension-system-monitor
    dnf_install gnome-tweaks
    # dnf_install firewall-config
fi

dnf_install ffmpeg
# sudo dnf swap ffmpeg-free ffmpeg --allowerasing
dnf_install fuse
dnf_install fuse-libs
dnf_install fuse3-libs
dnf_install gamemode
dnf_install google-chrome-stable
dnf_install java-25-openjdk
dnf_install langpacks-fr
dnf_install libreoffice
dnf_install libreoffice-grammalecte
# dnf_install papirus-icon-theme
dnf_install timeshift
dnf_install unrar
dnf_install wget2

dnf_install gstreamer1-plugins-base
dnf_install gstreamer1-plugins-good
dnf_install gstreamer1-plugins-bad-freeworld # RPM Fusion
dnf_install gstreamer1-plugins-ugly # RPM Fusion
dnf_install gstreamer1-plugin-libav

sudo dnf autoremove -y
sudo dnf clean all

flatpak uninstall --unused -y

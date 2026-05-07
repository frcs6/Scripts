#!/usr/bin/env bash

SCRIPT_DIR=$(dirname "${BASH_SOURCE[0]}")
source "$SCRIPT_DIR/../Shared/common-functions.sh"

if ! command -v apt >/dev/null 2>&1; then
    echo "Not a Debian-based system..."
    exit 0
fi

sudo apt update

apt_install flatpak

if is_gnome; then
    apt_install gnome-software
    apt_install gnome-software-plugin-flatpak
elif is_kde; then
    apt_install plasma-discover
    apt_install plasma-discover-backend-flatpak
fi

sudo flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

echo "Il est recommandé de se déconnecter et de se reconnecter pour que les modifications prennent effet."

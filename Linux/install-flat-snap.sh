#!/usr/bin/env bash

SCRIPT_DIR=$(dirname "${BASH_SOURCE[0]}")
source "$SCRIPT_DIR/common-functions.sh"

if ! command -v apt >/dev/null 2>&1; then
    echo "apt n'est pas disponible — script ignoré."
    exit 0
fi

sudo apt update

touch ~/.hidden
grep -qx "snap" ~/.hidden || echo "snap" >> ~/.hidden

apt_install flatpak
apt_install snapd

if is_ubuntu; then
    apt_install gnome-software
    apt_install gnome-software-plugin-flatpak
    apt_install gnome-software-plugin-snap
elif is_kubuntu; then
    apt_install plasma-discover
    apt_install plasma-discover-backend-flatpak
    apt_install plasma-discover-backend-snap
fi

sudo flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

echo "Il est recommandé de se déconnecter et de se reconnecter pour que les modifications prennent effet."

#!/usr/bin/env bash

SCRIPT_DIR=$(dirname "${BASH_SOURCE[0]}")
source "$SCRIPT_DIR/common-functions.sh"

sudo apt update

apt_install flatpak
apt_install gnome-software
apt_install gnome-software-plugin-flatpak
apt_install gnome-software-plugin-snap

sudo flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
sudo snap remove --purge snap-store
echo "Il est recommandé de se déconnecter et de se reconnecter pour que les modifications prennent effet."

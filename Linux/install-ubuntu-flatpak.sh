#!/usr/bin/env bash

sudo apt update
sudo apt install flatpak gnome-software-plugin-flatpak -y
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
snap remove --purge snap-store
echo "Il est recommandé de se déconnecter et de se reconnecter pour que les modifications prennent effet."

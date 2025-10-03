#!/usr/bin/env bash

sudo apt update

# Flatpak - Need logout
sudo apt install flatpak gnome-software-plugin-flatpak -y
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
snap remove --purge snap-store

# Software & Utilities (flatpak)
#flatpak install org.gimp.GIMP -y

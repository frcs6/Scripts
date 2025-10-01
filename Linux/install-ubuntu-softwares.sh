#!/usr/bin/env bash

SCRIPT_DIR=$(dirname "${BASH_SOURCE[0]}")
source "$SCRIPT_DIR/common-functions.sh"

mkdir ~/tmp
pushd ~/tmp

sudo apt update

# Papirus Icon Theme
sudo apt install papirus-icon-theme -y
snap install icon-theme-papirus

# File Roller
sudo apt install file-roller -y

# Inkscape
sudo apt install inkscape -y

# Spotify
sudo snap install spotify -y

# Flatseal
flatpak install com.github.tchx84.Flatseal -y

# Gimp
flatpak install org.gimp.GIMP -y

# VLC
flatpak install org.videolan.VLC -y

# KeePassXC
flatpak uninstall org.keepassxc.KeePassXC -y
sudo snap install keepassxc -y

# LibreOffice
snap remove --purge libreoffice
sudo apt install libreoffice -y # late version
sudo apt install ttf-mscorefonts-installer -y

popd
rm -rf ~/tmp

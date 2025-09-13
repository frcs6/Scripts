#!/usr/bin/env bash

SCRIPT_DIR=$(dirname "${BASH_SOURCE[0]}")
source "$SCRIPT_DIR/common-functions.sh"

mkdir ~/tmp
pushd ~/tmp

sudo apt update

sudo apt install wine
sudo dpkg --add-architecture i386
sudo apt update
sudo apt install gamemode:i386

#steam
flatpak install net.davidotek.pupgui2 -y
flatpak install com.heroicgameslauncher.hgl -y
flatpak install com.heroicgameslauncher.hgl -y
flatpak install net.lutris.Lutris -y # Pose soucis avec certains jeux (modify_ldt)

popd
rm -rf ~/tmp

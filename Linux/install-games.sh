#!/usr/bin/env bash

sudo apt update

# sudo apt install wine -y
# sudo dpkg --add-architecture i386
# sudo apt update
# sudo apt install gamemode:i386 -y

flatpak_install net.davidotek.pupgui2
flatpak_install com.heroicgameslauncher.hgl
flatpak_install net.lutris.Lutris # Pose soucis avec certains jeux (modify_ldt)

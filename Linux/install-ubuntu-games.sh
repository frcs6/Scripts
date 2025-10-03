#!/usr/bin/env bash

sudo apt update
sudo apt install wine -y
sudo dpkg --add-architecture i386
sudo apt update
sudo apt install gamemode:i386 -y

#steam
flatpak install net.davidotek.pupgui2 -y
flatpak install com.heroicgameslauncher.hgl -y
flatpak install com.heroicgameslauncher.hgl -y
flatpak install net.lutris.Lutris -y # Pose soucis avec certains jeux (modify_ldt)

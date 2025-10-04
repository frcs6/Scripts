#!/usr/bin/env bash

sudo apt autoremove papirus-icon-theme -y

flatpak uninstall com.github.tchx84.Flatseal -y
flatpak uninstall org.keepassxc.KeePassXC -y
flatpak uninstall org.videolan.VLC -y

sudo snap remove --purge icon-theme-papirus

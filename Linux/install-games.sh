#!/usr/bin/env bash

SCRIPT_DIR=$(dirname "${BASH_SOURCE[0]}")
source "$SCRIPT_DIR/common-functions.sh"

if ! command -v apt >/dev/null 2>&1; then
    echo "apt n'est pas disponible — script ignoré."
    exit 0
fi

sudo apt update

apt_install wine
flatpak_install net.davidotek.pupgui2
flatpak_install com.heroicgameslauncher.hgl
flatpak_install net.lutris.Lutris # Pose soucis avec certains jeux (modify_ldt)
install_steam

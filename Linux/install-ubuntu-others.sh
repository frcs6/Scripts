#!/usr/bin/env bash

SCRIPT_DIR=$(dirname "${BASH_SOURCE[0]}")
source "$SCRIPT_DIR/common-functions.sh"

sudo apt update

# Software & Utilities (apt)
if is_ubuntu; then
    apt_install gnome-calendar
    apt_install gnome-contacts
    apt_install gnome-games
    apt_install gnome-maps
    apt_install gnome-weather
elif is_kubuntu; then
    apt_install kdegames
    apt_install marble
fi

# Software & Utilities (snap)
snap_install spotify
snap_install vlc

# Software & Utilities (flatpak)
#flatpak_install com.github.PintaProject.Pinta
#flatpak_install org.gimp.GIMP
#flatpak_install org.inkscape.Inkscape
#flatpak_install org.kde.krita
flatpak_install org.keepassxc.KeePassXC

#!/usr/bin/env bash

SCRIPT_DIR=$(dirname "${BASH_SOURCE[0]}")
source "$SCRIPT_DIR/../Shared/common-functions.sh"

if is_gnome; then
    echo "Gnome"
    # flatpak_install de.swsnr.pictureoftheday
fi

# Deb
# apt_install spotify-client # Mint

# Flatpaks
# flatpak_install org.gimp.GIMP
# flatpak_install org.inkscape.Inkscape
# flatpak_install org.kde.krita
# flatpak_install org.keepassxc.KeePassXC
# flatpak_install com.github.PintaProject.Pinta
# flatpak_install com.github.tchx84.Flatseal
# flatpak_install com.spotify.Client

# Snaps
# snap_install gimp
# snap_install inkscape
# snap_install krita
# snap_install keepassxc
# snap_install pinta
# snap_install spotify

# Gaming
# flatpak_install com.vysp3r.ProtonPlus

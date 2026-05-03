#!/usr/bin/env bash

SCRIPT_DIR=$(dirname "${BASH_SOURCE[0]}")
source "$SCRIPT_DIR/common-functions.sh"

if command -v apt >/dev/null 2>&1; then
    echo "Debian/Ubuntu"
fi

if command -v dnf >/dev/null 2>&1; then
    echo "Fedora"
fi

if is_gnome; then
    echo "Gnome"
elif is_kde; then
    echo "KDE"
elif is_cinnamon; then
    echo "Cinnamon"
else
    echo "Autre"
fi

if command -v snap >/dev/null 2>&1; then
    echo "Snap est disponible"
fi
if command -v flatpak >/dev/null 2>&1; then
    echo "Flatpak est disponible"
fi

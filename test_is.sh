#!/usr/bin/env bash

SCRIPT_DIR=$(dirname "${BASH_SOURCE[0]}")
source "$SCRIPT_DIR/Shared/common-functions.sh"

if command -v apt >/dev/null 2>&1; then
    echo "Debian-based system..."
fi

if command -v dnf >/dev/null 2>&1; then
    echo "Fedora-based system..."
fi

if is_gnome; then
    echo "Gnome"
elif is_kde; then
    echo "KDE"
elif is_cinnamon; then
    echo "Cinnamon"
elif is_xfce; then
    echo "Xfce"
else
    echo "Other desktop environment"
fi

if command -v snap >/dev/null 2>&1; then
    echo "Snap is available"
fi
if command -v flatpak >/dev/null 2>&1; then
    echo "Flatpak is available"
fi

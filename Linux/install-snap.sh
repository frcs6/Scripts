#!/usr/bin/env bash

SCRIPT_DIR=$(dirname "${BASH_SOURCE[0]}")
source "$SCRIPT_DIR/common-functions.sh"

if ! command -v apt >/dev/null 2>&1; then
    echo "apt n'est pas disponible — script ignoré."
    exit 0
fi

sudo apt update

touch ~/.hidden
grep -qx "snap" ~/.hidden || echo "snap" >> ~/.hidden

apt_install snapd

if is_gnome; then
    apt_install gnome-software
    apt_install gnome-software-plugin-snap
    snap_remove snap-store
elif is_kde; then
    apt_install plasma-discover
    apt_install plasma-discover-backend-snap
fi

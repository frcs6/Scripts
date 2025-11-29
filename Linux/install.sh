#!/usr/bin/env bash

SCRIPT_DIR=$(dirname "${BASH_SOURCE[0]}")
source "$SCRIPT_DIR/common-functions.sh"

if command -v apt >/dev/null 2>&1; then
    sudo apt update
    sudo apt upgrade -y
fi
if command -v snap >/dev/null 2>&1; then
    sudo snap refresh
fi
if command -v flatpak >/dev/null 2>&1; then
    sudo flatpak update -y
fi

# TODEL
if command -v snap >/dev/null 2>&1; then
    snap_remove vlc
fi
# TODEL

if is_ubuntu; then
    apt_install file-roller
    apt_install gnome-calendar
    apt_install gnome-contacts
    apt_install gnome-games
    apt_install gnome-maps
    apt_install gnome-shell-extension-alphabetical-grid
    apt_install gnome-shell-extension-prefs
    apt_install gnome-shell-extensions
    apt_install gnome-tweaks
    apt_install gnome-weather
    snap_install spotify
    snap_remove snap-store
elif is_kubuntu; then
    apt_install kdegames
    apt_install marble
    snap_install spotify
elif is_cosmic; then
    apt_install gnome-games
    flatpak_install com.spotify.Client
elif is_mint; then
    apt_install gnome-games
    apt_install spotify-client
fi

if command -v apt >/dev/null 2>&1; then
    apt_install libfuse2t64
    apt_install samba
    apt_install timeshift
    apt_install ttf-mscorefonts-installer
    apt_install ubuntu-restricted-addons
    apt_install vlc
    apt_install wget
    apt_install gstreamer1.0-plugins-bad
    apt_install gstreamer1.0-libav
fi
flatpak_install org.keepassxc.KeePassXC

# Language Support (TODO: fix this for each distro)
if command -v apt >/dev/null 2>&1; then
    apt_install hunspell-en-ca
    apt_install hunspell-en-us
    apt_install hunspell-fr
    apt_install hyphen-en-ca
    apt_install hyphen-en-us
    apt_install hyphen-fr
    apt_install language-pack-en
    apt_install language-pack-fr
    apt_install libreoffice-help-en-us
    apt_install libreoffice-help-fr
    apt_install libreoffice-l10n-fr
    apt_install mythes-en-us
    apt_install mythes-fr
    apt_install aspell-en
    apt_install aspell-fr
    apt_install wamerican
    apt_install wcanadian
    apt_install wfrench
fi

mkdir -p ~/tmp
pushd ~/tmp > /dev/null

# Google Chrome
if command -v apt >/dev/null 2>&1; then
    if ! dpkg -s "google-chrome-stable" >/dev/null 2>&1; then
        echo "Installation de google-chrome-stable..."
        wget -q https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
        if [[ -f google-chrome-stable_current_amd64.deb ]]; then
            apt_install ./google-chrome-stable_current_amd64.deb
            rm ./google-chrome-stable_current_amd64.deb
        else
            echo "Erreur : le fichier .deb n'a pas été téléchargé."
        fi
    else
        echo "google-chrome-stable est déjà installé."
    fi
fi

popd
rm -rf ~/tmp

# Nettoyage final
if command -v apt >/dev/null 2>&1; then
    sudo apt autoremove --purge -y
    sudo apt autopurge -y
    sudo apt autoremove -y
fi
if command -v flatpak >/dev/null 2>&1; then
    flatpak uninstall --unused -y
fi

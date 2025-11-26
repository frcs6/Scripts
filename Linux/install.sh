#!/usr/bin/env bash

SCRIPT_DIR=$(dirname "${BASH_SOURCE[0]}")
source "$SCRIPT_DIR/common-functions.sh"

if command -v apt >/dev/null 2>&1; then
    sudo apt update
    sudo apt upgrade -y
fi
if command -v dnf >/dev/null 2>&1; then
    sudo dnf upgrade -y
    if ! rpm -q rpmfusion-free-release >/dev/null 2>&1; then
        sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm -y
        sudo dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y
        sudo dnf update
    fi
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
    snap_remove snap-store
elif is_cosmic; then
    apt_install gnome-games
    flatpak_install com.spotify.Client
elif is_mint; then
    apt_install gnome-games
    apt_install spotify-client
elif is_fedora; then
    dnf_install file-roller
    dnf_install file-roller-nautilus
    dnf_install gnome-calendar
    dnf_install gnome-contacts
    dnf_install gnome-maps
    dnf_install gnome-extensions-app
    dnf_install gnome-shell-extension-appindicator
    dnf_install gnome-shell-extension-apps-menu
    dnf_install gnome-shell-extension-dash-to-dock
    dnf_install gnome-shell-extension-drive-menu
    dnf_install gnome-shell-extension-places-menu
    dnf_install gnome-shell-extension-status-icons
    dnf_install gnome-shell-extension-system-monitor
    dnf_install gnome-shell-extension-user-theme
    dnf_install gnome-shell-extension-window-list
    dnf_install gnome-tweaks
    dnf_install gnome-weather
    flatpak_install com.spotify.Client
    #TODO dnf_install gnome-games
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
if command -v dnf >/dev/null 2>&1; then
    dnf_install fuse3-libs
    dnf_install gamemode
    dnf_remove mscore-fonts-all
    dnf_install libreoffice
    dnf_install samba
    dnf_install timeshift
    dnf_install vlc
    dnf_install wget2
    dnf_install gstreamer1-plugin-libav
    dnf_install gstreamer1-plugins-base
    dnf_install gstreamer1-plugins-good
    dnf_install gstreamer1-plugins-bad-free
    dnf_install gstreamer1-plugins-ugly-free
    dnf_install gstreamer1-plugins-bad-freeworld
    dnf_install gstreamer1-plugins-ugly    
fi
flatpak_install org.keepassxc.KeePassXC

# Language Support
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
if command -v dnf >/dev/null 2>&1; then
    sudo dnf autoremove -y
    sudo dnf clean all
fi
if command -v flatpak >/dev/null 2>&1; then
    flatpak uninstall --unused -y
fi

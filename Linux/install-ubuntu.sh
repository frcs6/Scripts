#!/usr/bin/env bash

SCRIPT_DIR=$(dirname "${BASH_SOURCE[0]}")
source "$SCRIPT_DIR/common-functions.sh"

mkdir -p ~/tmp
pushd ~/tmp > /dev/null

touch ~/.hidden
grep -qx "snap" ~/.hidden || echo "snap" >> ~/.hidden

sudo apt update
sudo apt upgrade -y

sudo snap refresh
sudo flatpak update -y

# Software & Utilities (apt)
if is_ubuntu; then
    apt_install file-roller
    apt_install gnome-tweaks
    apt_install gnome-shell-extension-alphabetical-grid
    apt_install gnome-shell-extension-prefs
    apt_install gnome-shell-extensions
fi
apt_install libfuse2t64
apt_install libreoffice
apt_install samba
apt_install timeshift
apt_install ttf-mscorefonts-installer
apt_install ubuntu-restricted-addons
apt_install wget

# Software & Utilities (snap)
snap_install firefox
snap_install spotify
snap_install vlc
snap_remove thunderbird

# Software & Utilities (flatpak)
flatpak_install org.keepassxc.KeePassXC

# Language Support
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

# Google Chrome
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

popd
rm -rf ~/tmp

# Nettoyage final
sudo apt autoremove --purge -y
sudo apt autopurge -y
sudo apt autoremove -y
if command -v flatpak >/dev/null 2>&1; then
    flatpak uninstall --unused -y
fi

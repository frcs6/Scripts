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

# Suppression des paquets inutiles
apt_remove hunspell-en-au
apt_remove hunspell-en-gb
apt_remove hunspell-en-med
apt_remove hunspell-en-za
apt_remove hunspell-fr-revised
apt_remove libreoffice-l10n-en-gb
apt_remove libreoffice-l10n-en-za
apt_remove mythes-en-au
apt_remove wbritish
apt_remove inkscape
snap_remove blender

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

# Software & Utilities (snap)
#snap_install snap-store
snap_install firefox
snap_install spotify
snap_install thunderbird
snap_install vlc
snap_remove gimp
snap_remove keepassxc
snap_remove msedit
snap_remove pinta

# Software & Utilities (flatpak)
flatpak_install com.github.PintaProject.Pinta
flatpak_install com.github.tchx84.Flatseal 
flatpak_install org.gimp.GIMP
flatpak_install org.inkscape.Inkscape
flatpak_install org.kde.krita
flatpak_install org.keepassxc.KeePassXC

# Install Papirus Icon Theme
apt_remove papirus-icon-theme
snap_remove icon-theme-papirus

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

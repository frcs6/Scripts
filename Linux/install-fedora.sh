#!/usr/bin/env bash

SCRIPT_DIR=$(dirname "${BASH_SOURCE[0]}")
source "$SCRIPT_DIR/common-functions.sh"

if ! command -v dnf >/dev/null 2>&1; then
    echo "dnf n'est pas disponible — script ignoré."
    exit 0
fi

sudo dnf upgrade -y    
if ! rpm -q rpmfusion-free-release >/dev/null 2>&1; then
    sudo dnf copr disable phracek/PyCharm
    sudo dnf config-manager setopt rpmfusion-nonfree-steam.enabled=0
    sudo dnf config-manager setopt rpmfusion-nonfree-nvidia-driver.enabled=0

    sudo dnf install \
        https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
        https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y

    sudo dnf update -y
fi

if command -v snap >/dev/null 2>&1; then
    sudo snap refresh
else
    sudo dnf install snapd -y
    sudo ln -s /var/lib/snapd/snap /snap
    touch ~/.hidden
    grep -qx "snap" ~/.hidden || echo "snap" >> ~/.hidden
fi
flatpak update -y

dnf_install file-roller
dnf_install file-roller-nautilus
dnf_install gnome-calendar
dnf_install gnome-contacts
dnf_install gnome-maps
dnf_install gnome-extensions-app
dnf_install gnome-shell-extension-appindicator
dnf_install gnome-shell-extension-apps-menu
dnf_install gnome-shell-extension-blur-my-shell
dnf_install gnome-shell-extension-dash-to-dock
dnf_install gnome-shell-extension-drive-menu
dnf_install gnome-shell-extension-places-menu
dnf_install gnome-shell-extension-system-monitor
dnf_install gnome-shell-extension-user-theme
dnf_install gnome-shell-extension-window-list
dnf_install gnome-tweaks
dnf_install gnome-weather

dnf_install fuse3-libs
dnf_install google-chrome-stable
dnf_install libreoffice
dnf_install samba
dnf_install timeshift
dnf_install vlc
dnf_install wget2
dnf_install gamemode
dnf_install gstreamer1-plugin-libav
dnf_install gstreamer1-plugins-base
dnf_install gstreamer1-plugins-good
dnf_install gstreamer1-plugins-bad-free
dnf_install gstreamer1-plugins-ugly-free
dnf_install gstreamer1-plugins-bad-freeworld
dnf_install gstreamer1-plugins-ugly 

dnf_install langpacks-fr 
dnf_install hunspell-fr 
dnf_install hyphen-fr 
dnf_install mythes-fr 
dnf_install libreoffice-langpack-fr 
dnf_install libreoffice-help-fr 
dnf_install glibc-langpack-fr

# sudo dnf install amd-ucode
# sudo dnf install mesa-vulkan-drivers mesa-vulkan-drivers.i686 vulkan-tools
# sudo dnf install rocm-opencl
# sudo dnf install pulseaudio-utils pipewire-alsa pipewire-pulseaudio
# sudo dnf install gstreamer1-plugins-{good,bad-free,bad-free-extras,ugly} ffmpeg
# sudo dnf install rtlwifi-firmware
# sudo dnf install bolt
# sudo systemctl enable --now bolt.service
# sudo dnf install smartmontools nvme-cli
# sudo dnf install tlp tlp-rdw
# sudo systemctl enable --now tlp

snap_install spotify
flatpak_install org.keepassxc.KeePassXC

#dnf_install dotnet-sdk-10.0
#snap_install code --classic
#snap_install rider --classic

# Nettoyage final
sudo dnf autoremove -y
sudo dnf clean all
flatpak uninstall --unused -y

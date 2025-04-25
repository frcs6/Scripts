#!/usr/bin/env bash

sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\nautorefresh=1\ntype=rpm-md\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" | sudo tee /etc/yum.repos.d/vscode.repo > /dev/null

sudo dnf update

sudo dnf install gnome-tweaks -y
sudo dnf install gnome-firmware -y
sudo dnf install gnome-extensions-app -y
sudo dnf install gnome-shell-extension-appindicator -y
sudo dnf install gnome-shell-extension-dash-to-dock -y

sudo dnf install aspell-fr -y
sudo dnf install libreoffice-langpack-fr -y

sudo dnf install redhat-text-vf-fonts -y
sudo dnf install redhat-text-fonts -y
sudo dnf install redhat-mono-vf-fonts -y
sudo dnf install redhat-mono-fonts -y
sudo dnf install redhat-display-vf-fonts -y
sudo dnf install redhat-display-fonts -y

sudo dnf install samba -y
sudo dnf install google-chrome-stable -y
sudo dnf install vlc -y
sudo dnf install seahorse -y
sudo dnf install file-roller -y
sudo dnf install gimp -y
sudo dnf install inkscape -y
sudo dnf install remmina -y
sudo dnf install keepassxc -y
sudo dnf install dotnet-sdk-8.0 -y
sudo dnf install dotnet-sdk-9.0 -y
sudo dnf install code -y
sudo dnf install timeshift -y

sudo dnf install epapirus-icon-theme -y
sudo dnf install libreoffice-icon-theme-papirus -y
sudo dnf install papirus-icon-theme-dark -y
sudo dnf install papirus-icon-theme-light -y
sudo dnf install papirus-icon-theme -y

flatpak install fedora com.github.tchx84.Flatseal -y
flatpak install flathub com.mattjakeman.ExtensionManager -y
flatpak install flathub com.spotify.Client -y

#sudo dnf remove libreoffice*
#flatpak install flathub org.onlyoffice.desktopeditors -y

sudo dnf swap ffmpeg-free ffmpeg --allowerasing -y
sudo dnf update @multimedia --setopt="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin -y


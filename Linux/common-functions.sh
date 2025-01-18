#!/bin/bash

create_symlink() {
  local TARGET_PATH=$1
  local LINK_PATH=$2
  if [ -d "$TARGET_PATH" ]; then
    if [ -L "$LINK_PATH" ]; then
      echo "$LINK_PATH is already a symbolic link"
      rm "$LINK_PATH"
    else
      echo "$LINK_PATH is not a symbolic link"
      rm -rf "$LINK_PATH"
    fi
    ln -s "$TARGET_PATH" "$LINK_PATH"
    echo "Created symlink: $LINK_PATH -> $TARGET_PATH"
  else
    echo "Target directory does not exist: $TARGET_PATH"
  fi
}

install_base_softwares() {
    sudo apt install ubuntu-restricted-addons -y
    sudo apt install samba -y
    sudo apt install keepassxc -y
    sudo apt install papirus-icon-theme -y
}

install_base_flatpaks()
{
    flatpak install com.github.tchx84.Flatseal -y
}

install_dropbox() {
    wget -O dropbox.deb https://www.dropbox.com/download?dl=packages/ubuntu/dropbox_2024.04.17_amd64.deb
    sudo apt install ./dropbox.deb -y
}

install_google_chrome() {
    wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
    sudo apt install ./google-chrome-stable_current_amd64.deb -y
}

install_insync() {
  local FILE_MANAGER=$1

  wget https://cdn.insynchq.com/builds/linux/3.9.4.60020/insync_3.9.4.60020-noble_amd64.deb
  sudo apt install ./insync_3.9.4.60020-noble_amd64.deb -y
  sudo apt update

  if [ "$FILE_MANAGER" == "nautilus" ]; then    
    sudo apt install insync-nautilus -y
  elif [ "$FILE_MANAGER" == "nemo" ]; then
    sudo apt install insync-nemo -y
  else
    echo "Unsupported file manager: $FILE_MANAGER"
    return 1
  fi
}

install_spotify() {
  curl -sS https://download.spotify.com/debian/pubkey_C85668DF69375001.gpg | sudo gpg --dearmor --yes -o /etc/apt/trusted.gpg.d/spotify.gpg
  echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list

  sudo apt-get update
  sudo apt-get install spotify-client
}

install_asus_camera()
{
  sudo apt install qv4l2
  echo "LD_PRELOAD=/lib/x86_64-linux-gnu/libv4l/v4l1compat.so" | sudo tee -a /etc/environment
}

install_yoga_drivers() {
    sudo apt install build-essential dkms git iw -y
    mkdir ~/Drivers
    pushd ~/Drivers
    git clone https://github.com/morrownr/8821au-20210708.git
    pushd ./8821au-20210708
    sudo ./install-driver.sh
    popd
    popd
}

install_games() {
  wget https://repo.steampowered.com/steam/archive/precise/steam_latest.deb
  sudo apt install ./steam_latest.deb -y
  flatpak install flathub com.heroicgameslauncher.hgl -y
  flatpak install flathub net.lutris.Lutris -y
}

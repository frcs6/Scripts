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

  if [ "$FILE_MANAGER" == "nautilus" ]; then
    wget https://cdn.insynchq.com/builds/linux/3.8.2.50468/insync-nautilus_3.8.2.50468_all.deb
    sudo apt install ./insync-nautilus_3.8.2.50468_all.deb -y
  elif [ "$FILE_MANAGER" == "nemo" ]; then
    wget https://cdn.insynchq.com/builds/linux/3.7.9.50368/insync-nemo_3.7.9.50368_all.deb
    sudo apt install ./insync-nemo_3.7.9.50368_all.deb -y
  else
    echo "Unsupported file manager: $FILE_MANAGER"
    return 1
  fi
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

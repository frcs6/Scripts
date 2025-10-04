#!/bin/bash

apt_install() {
    local package="$1"
    if ! dpkg -s "$package" >/dev/null 2>&1; then
        echo "Installation de $package..."
        sudo apt install "$package" -y
    else
        echo "apt: $package est déjà installé."
    fi
}

snap_install() {
    local package="$1"
    local options="$2"

    if ! snap list | grep -q "^$package\b"; then
        echo "Installation du snap $package..."
        sudo snap install "$package" $options
    else
        echo "snap: $package est déjà installé."
    fi
}

flatpak_install() {
    local package="$1"
    shift
    local options="$@"

    # Vérifie si flatpak est installé
    if ! command -v flatpak >/dev/null 2>&1; then
        echo "Erreur : flatpak n'est pas installé."
        return 1
    fi

    # Vérifie si Flathub est configuré
    if ! flatpak remotes | grep -q "^flathub\b"; then
        echo "Erreur : le dépôt Flathub n'est pas configuré."
        return 1
    fi

    # Vérifie si le paquet est déjà installé
    if flatpak info "$package" >/dev/null 2>&1; then
        echo "Le flatpak $package est déjà installé."
    else
        echo "Installation du flatpak $package..."
        flatpak install $options "$package" -y
    fi
}

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

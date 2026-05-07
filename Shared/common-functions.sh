#!/bin/bash

apt_install() {
    local package="$1"

    if ! dpkg -s "$package" >/dev/null 2>&1; then
        echo "apt: $package installation..."
        sudo apt install "$package" -y
    else
        echo "apt: $package is already installed."
    fi
}

apt_remove() {
    local package="$1"

    if ! dpkg -s "$package" >/dev/null 2>&1; then
        echo "apt: $package is already removed."
    else
        echo "apt: $package removing..."
        sudo apt autoremove --purge "$package" -y
    fi
}

dnf_install() {
    local package="$1"

    if ! rpm -q "$package" >/dev/null 2>&1; then
        echo "dnf: $package installation..."
        sudo dnf install "$package" -y
    else
        echo "dnf: $package is already installed."
    fi
}

dnf_remove() {
    local package="$1"

    if ! rpm -q "$package" >/dev/null 2>&1; then
        echo "dnf: $package is already removed."
    else
        echo "dnf: $package removing..."
        sudo dnf remove "$package" -y
    fi
}

snap_install() {
    local package="$1"
    local options="$2"

    if ! snap list | grep -q "^$package\b"; then
        echo "snap: $package installation..."
        sudo snap install "$package" $options
    else
        echo "snap: $package is already installed."
    fi
}

snap_remove() {
    local package="$1"

    if ! snap list | grep -q "^$package\b"; then
        echo "snap: $package is already removed."
    else
        echo "snap: $package removing..."
        sudo snap remove --purge "$package"
    fi
}

flatpak_install() {
    local package="$1"

    if flatpak info "$package" >/dev/null 2>&1; then
        echo "flatpak: $package is already installed."
    else
        echo "flatpak: $package installation..."
        flatpak install flathub "$package" -y
    fi
}

flatpak_uninstall() {
    local package="$1"

    if flatpak info "$package" >/dev/null 2>&1; then
        echo "flatpak: $package removing..."
        flatpak uninstall --delete-data "$package" -y
    else
        echo "flatpak: $package is already removed."
    fi
}

create_symlink() {
  local TARGET_PATH=$1
  local LINK_PATH=$2
  if [ -d "$TARGET_PATH" ]; then
    if [ -L "$LINK_PATH" ]; then
      echo "$LINK_PATH is already a symlink."
      rm "$LINK_PATH"
    else
      echo "$LINK_PATH is not a symlink."
      rm -rf "$LINK_PATH"
    fi
    ln -s "$TARGET_PATH" "$LINK_PATH"
    echo "Symlink created : $LINK_PATH → $TARGET_PATH"
  else
    echo "The target directory does not exist : $TARGET_PATH"
  fi
}

install_google_chrome() {
    mkdir -p ~/tmp
    pushd ~/tmp > /dev/null

    if command -v apt >/dev/null 2>&1; then
        if ! dpkg -s "google-chrome-stable" >/dev/null 2>&1; then
            echo "Installing google-chrome-stable..."
            wget -q https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
            if [[ -f google-chrome-stable_current_amd64.deb ]]; then
                apt_install ./google-chrome-stable_current_amd64.deb
                rm ./google-chrome-stable_current_amd64.deb
            else
                echo "Error: The .deb file was not downloaded."
            fi
        else
            echo "google-chrome-stable is already installed."
        fi
    fi

    popd
    rm -rf ~/tmp
}

is_gnome() {
    local x=${XDG_CURRENT_DESKTOP:-}
    x=${x,,}
    case "$x" in
        *gnome*|*ubuntu*|*unity*) return 0 ;;
    esac
    return 1
}

is_kde() {
    local x=${XDG_CURRENT_DESKTOP:-}
    x=${x,,}
    case "$x" in
        *kde*|*plasma*|*kubuntu*) return 0 ;;
    esac
    return 1
}

is_cinnamon() {
    local x=${XDG_CURRENT_DESKTOP:-}
    x=${x,,}
    case "$x" in
        *x-cinnamon*) return 0 ;;
    esac
    return 1
}

is_xfce() {
    local x=${XDG_CURRENT_DESKTOP:-}
    x=${x,,}
    case "$x" in
        *xfce*) return 0 ;;
    esac
    return 1
}

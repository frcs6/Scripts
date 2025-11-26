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

apt_remove() {
    local package="$1"

    if ! dpkg -s "$package" >/dev/null 2>&1; then
        echo "apt: $package est déjà supprimé."
    else
        echo "Suppression de $package..."
        sudo apt autoremove --purge "$package" -y
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

snap_remove() {
    local package="$1"

    if ! snap list | grep -q "^$package\b"; then
        echo "snap: $package est déjà supprimé."
    else
        echo "Suppression du snap $package..."
        sudo snap remove --purge "$package"
    fi
}

flatpak_install() {
    local package="$1"

    if ! command -v flatpak >/dev/null 2>&1; then
        echo "Erreur : flatpak n'est pas installé."
        return 1
    fi

    if ! flatpak remotes | grep -q "^flathub\b"; then
        echo "Erreur : le dépôt Flathub n'est pas configuré."
        return 1
    fi

    if flatpak info "$package" >/dev/null 2>&1; then
        echo "flatpak: $package est déjà installé."
    else
        echo "Installation du flatpak $package..."
        flatpak install flathub "$package" -y
    fi
}

flatpak_uninstall() {
    local package="$1"

    if ! command -v flatpak >/dev/null 2>&1; then
        echo "Erreur : flatpak n'est pas installé."
        return 1
    fi

    if flatpak info "$package" >/dev/null 2>&1; then
        echo "Suppression du flatpak $package..."
        flatpak uninstall --delete-data "$package" -y
    else
        echo "flatpak: $package est déjà supprimé."
    fi
}

create_symlink() {
  local TARGET_PATH=$1
  local LINK_PATH=$2
  if [ -d "$TARGET_PATH" ]; then
    if [ -L "$LINK_PATH" ]; then
      echo "$LINK_PATH est déjà un lien symbolique."
      rm "$LINK_PATH"
    else
      echo "$LINK_PATH n'est pas un lien symbolique."
      rm -rf "$LINK_PATH"
    fi
    ln -s "$TARGET_PATH" "$LINK_PATH"
    echo "Lien symbolique créé : $LINK_PATH → $TARGET_PATH"
  else
    echo "Le répertoire cible n'existe pas : $TARGET_PATH"
  fi
}

is_ubuntu() {
    if [ -f /etc/os-release ]; then
        . /etc/os-release
        case "$ID" in
            ubuntu) return 0 ;;
        esac
        case "$ID_LIKE" in
            *ubuntu*|*debian*) return 0 ;;
        esac
    fi

    return 1
}

is_kubuntu() {
    if [ "$XDG_CURRENT_DESKTOP" = "KDE" ]; then
        return 0
    fi
    return 1
}

is_mint() {
    if [ "$XDG_CURRENT_DESKTOP" = "X-Cinnamon" ]; then
        return 0
    fi
    return 1
}

is_cosmic() {
    if [ "$XDG_CURRENT_DESKTOP" = "COSMIC" ]; then
        return 0
    fi
    return 1
}

is_fedora() {
    # Vérifie /etc/os-release (ID / ID_LIKE) pour détecter Fedora/RHEL
    if [ -f /etc/os-release ]; then
        . /etc/os-release
        case "$ID" in
            fedora) return 0 ;;
        esac
        case "$ID_LIKE" in
            *fedora*|*rhel*) return 0 ;;
        esac
    fi
    return 1
}
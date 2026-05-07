if command -v apt >/dev/null 2>&1; then
    echo "Updating Debian-based system..."
    sudo apt update
    sudo apt full-upgrade -y
    sudo apt autoremove --purge -y
fi

if command -v dnf >/dev/null 2>&1; then
    echo "Updating Fedora-based system..."
    sudo dnf upgrade -y
    sudo dnf autoremove -y
    sudo dnf clean all
fi

if command -v snap >/dev/null 2>&1; then
    echo "Updating Snap system..."
    sudo snap refresh
fi

if command -v flatpak >/dev/null 2>&1; then
    echo "Updating Flatpak system..."
    flatpak update -y
    flatpak uninstall --unused -y
fi

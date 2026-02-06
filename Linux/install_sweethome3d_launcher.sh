#!/usr/bin/env bash

set -euo pipefail

APP_NAME="Sweet Home 3D"
APP_DIR="$HOME/Apps/SweetHome3D-7.5"
EXEC_PATH="$APP_DIR/SweetHome3D"
ICON_PATH="$APP_DIR/SweetHome3DIcon.png"

DESKTOP_FILE="$HOME/.local/share/applications/sweethome3d.desktop"
MIME_DIR="$HOME/.local/share/mime/packages"
MIME_FILE="$MIME_DIR/sweethome3d.xml"

echo "==> Création du type MIME ~/.local/share/mime/packages/sweethome3d.xml"
mkdir -p "$MIME_DIR"

cat > "$MIME_FILE" <<EOF
<?xml version="1.0" encoding="UTF-8"?>
<mime-info xmlns="http://www.freedesktop.org/standards/shared-mime-info">
  <mime-type type="application/x-sweethome3d">
    <comment>Sweet Home 3D project</comment>
    <glob pattern="*.sh3d"/>
  </mime-type>
</mime-info>
EOF

echo "==> Mise à jour de la base MIME"
update-mime-database "$HOME/.local/share/mime"

echo "==> Création du fichier .desktop"
mkdir -p "$(dirname "$DESKTOP_FILE")"

cat > "$DESKTOP_FILE" <<EOF
[Desktop Entry]
Type=Application
Name=$APP_NAME
Exec=$EXEC_PATH %f
Icon=$ICON_PATH
Terminal=false
Categories=Graphics;3DGraphics;
MimeType=application/x-sweethome3d;
EOF

chmod +x "$DESKTOP_FILE"

echo "==> Mise à jour de la base des applications"
update-desktop-database "$HOME/.local/share/applications"

echo "==> Vérification du type MIME"
FILE_TEST=$(xdg-mime query filetype test.sh3d 2>/dev/null || true)
echo "Type MIME détecté pour test.sh3d : $FILE_TEST"

echo "==> Installation terminée."
echo "Tu peux maintenant ouvrir un .sh3d avec clic droit → Ouvrir avec → Sweet Home 3D."

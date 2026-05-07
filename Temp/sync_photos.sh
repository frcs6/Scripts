#!/bin/bash

# Configuration
SMB_SHARE="//10.0.0.2/photos"
MOUNT_POINT="/mnt/dadou_photos"
DESTINATION="/home/frcs6/Photos"
CREDENTIALS_FILE="/etc/smb-credentials"

# Vérifie si le dossier de montage existe, sinon le crée
if [ ! -d "$MOUNT_POINT" ]; then
    sudo mkdir -p "$MOUNT_POINT"
fi

# Monte le partage SMB
echo "🔗 Montage du partage SMB..."
sudo mount -t cifs "$SMB_SHARE" "$MOUNT_POINT" -o credentials="$CREDENTIALS_FILE",rw,vers=3.0

# Vérifie si le montage a réussi
if mountpoint -q "$MOUNT_POINT"; then
    echo "✅ Montage réussi. Synchronisation en cours..."

    # Synchronisation avec rsync
    rsync -avh --delete "$MOUNT_POINT"/ "$DESTINATION"/

    echo "✅ Synchronisation terminée."

    # Démonte le partage
    echo "🔌 Démontage du partage..."
    sudo umount "$MOUNT_POINT"
    echo "✅ Partage démonté."
else
    echo "❌ Échec du montage. Vérifie les identifiants ou la connexion réseau."
    exit 1
fi

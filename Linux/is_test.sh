#!/bin/bash

# Source les fonctions communes
source ./common-functions.sh

echo "=== Test des fonctions is_* ==="
echo ""

# Test is_ubuntu
if is_ubuntu; then
    echo "✓ is_ubuntu : VRAI (c'est Ubuntu ou dérivé)"
else
    echo "✗ is_ubuntu : FAUX (ce n'est pas Ubuntu)"
fi

# Test is_fedora
if is_fedora; then
    echo "✓ is_fedora : VRAI (c'est Fedora ou dérivé)"
else
    echo "✗ is_fedora : FAUX (ce n'est pas Fedora)"
fi

# Test is_kubuntu
if is_kubuntu; then
    echo "✓ is_kubuntu : VRAI (environnement KDE détecté)"
else
    echo "✗ is_kubuntu : FAUX (pas d'environnement KDE)"
fi

# Test is_mint
if is_mint; then
    echo "✓ is_mint : VRAI (environnement Cinnamon détecté)"
else
    echo "✗ is_mint : FAUX (pas d'environnement Cinnamon)"
fi

# Test is_cosmic
if is_cosmic; then
    echo "✓ is_cosmic : VRAI (environnement COSMIC détecté)"
else
    echo "✗ is_cosmic : FAUX (pas d'environnement COSMIC)"
fi

echo ""
echo "=== Infos système ==="
echo "XDG_CURRENT_DESKTOP: $XDG_CURRENT_DESKTOP"
if [ -f /etc/os-release ]; then
    . /etc/os-release
    echo "ID: $ID"
    echo "ID_LIKE: $ID_LIKE"
    echo "PRETTY_NAME: $PRETTY_NAME"
fi
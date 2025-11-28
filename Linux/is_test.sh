#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR=$(dirname "${BASH_SOURCE[0]}")
source "$SCRIPT_DIR/common-functions.sh"

# collect is_ functions
mapfile -t funcs < <(declare -F | awk '{print $3}' | grep '^is_' || true)

if [ "${#funcs[@]}" -eq 0 ]; then
  echo "Aucune fonction is_ trouvée."
  exit 1
fi

echo "Test des fonctions is_ dans $SCRIPT_DIR/common-functions.sh"
echo

for fn in "${funcs[@]}"; do
  if ! declare -F "$fn" >/dev/null 2>&1; then
    printf "%-24s: non définie\n" "$fn"
    continue
  fi

  if "$fn"; then
    printf "%-24s: détecté\n" "$fn"
  else
    printf "%-24s: non détecté\n" "$fn"
  fi
done

exit 0
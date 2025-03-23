#!/usr/bin/env bash
set -euo pipefail

REPO_URL="git@github.com:wijo-no/dev-setup.git"
TARGET_DIR="/home/shared/nix"
FLAKE_ENTRY="$(whoami)@ubuntu"
CURRENT_USER=$(whoami)

echo "[INFO] Starter dev-setup installasjon for bruker: $CURRENT_USER"

if ! command -v nix >/dev/null 2>&1; then
  echo "[INFO] Nix ikke funnet – installerer (multi-user)..."
  bash <(curl -L https://nixos.org/nix/install) --daemon
  . /etc/profile.d/nix.sh
else
  echo "[OK] Nix er allerede installert"
fi


# 3. Test igjen
if ! command -v nix >/dev/null 2>&1; then
  echo "[ERROR] Nix ikke funnet – men multi-user Nix ser ut til å være installert."
  echo "Avbryter for å unngå feilinstallasjon."
  exit 1
else
  echo "[OK] Nix er tilgjengelig – fortsetter"
fi

if [ -f /etc/nix/nix.conf ]; then
  if ! grep -q "experimental-features.*flakes" /etc/nix/nix.conf; then
    echo "[INFO] Legger til 'experimental-features = nix-command flakes' i /etc/nix/nix.conf"
    echo "experimental-features = nix-command flakes" | sudo tee -a /etc/nix/nix.conf >/dev/null
  else
    echo "[OK] 'experimental-features' er allerede satt"
  fi
else
  echo "[INFO] Oppretter /etc/nix/nix.conf med experimental-features"
  echo "experimental-features = nix-command flakes" | sudo tee /etc/nix/nix.conf >/dev/null
fi



# 2. Opprett felles katalog hvis den ikke finnes
if [ ! -d "$TARGET_DIR" ]; then
  echo "[INFO] Oppretter felles katalog $TARGET_DIR"
  sudo mkdir -p "$TARGET_DIR"
  sudo chmod 755 "$TARGET_DIR"
  sudo chown "$CURRENT_USER":"$CURRENT_USER" "$TARGET_DIR"
fi

# 3. Klon repo hvis det ikke er der
if [ ! -d "$TARGET_DIR/.git" ]; then
  echo "[INFO] Kloner dev-setup repo til $TARGET_DIR"
  git clone "$REPO_URL" "$TARGET_DIR"
else
  echo "[OK] Repo finnes allerede i $TARGET_DIR"
fi

# 4. Kjør Home Manager-konfig for gjeldende bruker
echo "[INFO] Kjører Home Manager for $FLAKE_ENTRY"
nix run github:nix-community/home-manager -- switch --flake "$TARGET_DIR#$FLAKE_ENTRY"

echo "[✅] Ferdig – Home Manager-konfig er aktivert for $CURRENT_USER"

exec zsh

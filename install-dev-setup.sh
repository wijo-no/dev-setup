#!/usr/bin/env bash
set -euo pipefail

REPO_URL="git@github.com:wijo-no/dev-setup.git"
TARGET_DIR="/home/shared/nix"
FLAKE_ENTRY="$(whoami)@ubuntu"
CURRENT_USER=$(whoami)

echo "[INFO] Starter dev-setup installasjon for bruker: $CURRENT_USER"

# 1. Prøv å finne nix-kommandoen
if ! command -v nix >/dev/null 2>&1; then
  # 2. Hvis ikke i $PATH, prøv å source global miljøfil
  if [ -f /etc/profile.d/nix.sh ]; then
    echo "[INFO] Laster multi-user Nix-miljø fra /etc/profile.d/nix.sh"
    . /etc/profile.d/nix.sh
  fi
fi

# 3. Test igjen
if ! command -v nix >/dev/null 2>&1; then
  echo "[ERROR] Nix ikke funnet – men multi-user Nix ser ut til å være installert."
  echo "Avbryter for å unngå feilinstallasjon."
  exit 1
else
  echo "[OK] Nix er tilgjengelig – fortsetter"
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

#!/usr/bin/env bash
set -euo pipefail

REPO_URL="https://github.com/wijo-no/dev-setup.git"
TARGET_DIR="/home/shared/nix"
FLAKE_ENTRY="$(whoami)@ubuntu"
CURRENT_USER=$(whoami)

echo "[INFO] Starter dev-setup installasjon for bruker: $CURRENT_USER"


# ❗ ADVARSEL: Fjern /home/shared hvis den finnes – brukes for reinstallering
if [ -d "/home/shared" ]; then
  echo "[ADVARSEL] /home/shared eksisterer – sletter hele mappen!"
  sudo rm -rf /home/shared
fi



# 1. Sjekk om gruppe finnes, lag hvis den mangler
if ! getent group nixusers >/dev/null; then
  echo "[INFO] Oppretter gruppe 'nixusers'"
  sudo groupadd nixusers
else
  echo "[OK] Gruppe 'nixusers' finnes allerede"
fi

# 2. Legg bruker til i gruppa
if id "$CURRENT_USER" | grep -qv "nixusers"; then
  echo "[INFO] Legger $CURRENT_USER til i gruppen 'nixusers'"
  sudo usermod -aG nixusers "$CURRENT_USER"
else
  echo "[OK] $CURRENT_USER er allerede i gruppen 'nixusers'"
fi

# 3. Lag /home/shared og sett rettigheter
if [ ! -d "/home/shared" ]; then
  echo "[INFO] Oppretter /home/shared"
  sudo mkdir -p /home/shared
fi

sudo chown root:nixusers /home/shared
sudo chmod 2775 /home/shared  # rwxrwsr-x + setgid

# 4. Installer Nix hvis mangler
if ! command -v nix >/dev/null 2>&1; then
  echo "[INFO] Nix ikke funnet – installerer (multi-user)..."
  bash <(curl -L https://nixos.org/nix/install) --daemon
  . /etc/profile.d/nix.sh
else
  echo "[OK] Nix er allerede installert"
fi

# 5. Test igjen
if ! command -v nix >/dev/null 2>&1; then
  echo "[ERROR] Nix ikke funnet – men multi-user Nix ser ut til å være installert."
  echo "Avbryter for å unngå feilinstallasjon."
  exit 1
else
  echo "[OK] Nix er tilgjengelig – fortsetter"
fi

# 6. Sørg for flakes og nix-command er aktivert
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

# 7. Klon repo hvis det ikke finnes
if [ ! -d "$TARGET_DIR/.git" ]; then
  echo "[INFO] Kloner dev-setup repo til $TARGET_DIR"
  sudo git clone "$REPO_URL" "$TARGET_DIR"
else
  echo "[OK] Repo finnes allerede i $TARGET_DIR"
fi

# 8. Sett riktig gruppe og rettigheter på repo
echo "[INFO] Setter gruppe-rettigheter på $TARGET_DIR"
sudo chown -R root:nixusers "$TARGET_DIR"
sudo chmod -R g+rwX "$TARGET_DIR"
sudo find "$TARGET_DIR" -type d -exec chmod g+s {} +

# 9. Gi denne brukeren eierskap for bygging
echo "[INFO] Sørger for at $CURRENT_USER eier repoet"
sudo chown -R "$CURRENT_USER":"nixusers" "$TARGET_DIR"

# 10. Kjør Home Manager for brukeren
echo "[INFO] Kjører Home Manager for $FLAKE_ENTRY"
nix run github:nix-community/home-manager -- switch --flake "$TARGET_DIR#$FLAKE_ENTRY"

echo "[✅] Ferdig – Home Manager-konfig er aktivert for $CURRENT_USER"

exec zsh


#!/bin/bash
set -e

echo "[*] Updating system..."
sudo apt update && sudo apt upgrade -y

echo "[*] Installing dependencies..."
sudo apt install -y wine alsa-utils pulseaudio curl unzip

echo "[*] Enabling ALSA loopback..."
sudo modprobe snd-aloop
echo "snd-aloop" | sudo tee -a /etc/modules

echo "[*] Creating Wine prefix..."
wineboot

echo "[*] Downloading Zello installer..."
wget -O ZelloSetup.exe https://zello.com/data/ZelloSetup.exe
wine ZelloSetup.exe

read -p "Install AllStarLink ASL 3.0? (y/n): " INSTALL_ASL
if [[ "$INSTALL_ASL" == "y" || "$INSTALL_ASL" == "Y" ]]; then
    echo "[*] Installing ASL 3.0..."
    curl -O https://allstarlink.org/installallstar
    chmod +x installallstar
    sudo ./installallstar
fi

echo "[*] Setting up Zello service..."
sudo cp zello.service /etc/systemd/system/zello.service
sudo systemctl daemon-reexec
sudo systemctl enable zello.service

echo "[*] Done. Launch Zello once to log in and configure VOX with ALSA Loopback."

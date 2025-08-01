#!/bin/bash
set -e

echo "[*] Installing dependencies..."
sudo apt update
sudo apt install -y wine alsa-utils pulseaudio

echo "[*] Enabling ALSA loopback..."
sudo modprobe snd-aloop
echo "snd-aloop" | sudo tee -a /etc/modules

echo "[*] Creating Wine prefix..."
wineboot

echo "[*] Downloading Zello installer..."
wget -O ZelloSetup.exe https://zello.com/data/ZelloSetup.exe

echo "[*] Installing Zello via Wine..."
wine ZelloSetup.exe

echo "[*] Setting up systemd service..."
sudo cp zello.service /etc/systemd/system/zello.service
sudo systemctl daemon-reexec
sudo systemctl enable zello.service

echo "[*] Done. Please launch Zello once manually via wine and log in."
echo "Then restart the system or run 'sudo systemctl start zello.service'"

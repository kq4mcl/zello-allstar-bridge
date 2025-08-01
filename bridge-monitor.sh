#!/bin/bash
# Very basic Zello process monitor

while true; do
    if ! pgrep -f "Zello.exe" > /dev/null; then
        echo "[!] Zello not running, restarting..."
        /usr/bin/bash /opt/zello-allstar-bridge/zello_launcher.sh &
    fi
    sleep 10
done

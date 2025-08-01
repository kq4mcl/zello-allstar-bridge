#!/bin/bash
# Simple watchdog script to restart Zello if it crashes or audio drops

while true; do
    if ! pgrep -f "Zello.exe" > /dev/null; then
        echo "$(date) - Zello not running, restarting..."
        /opt/zello-allstar-bridge/zello_launcher.sh &
    fi
    sleep 15
done

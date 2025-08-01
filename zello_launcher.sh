#!/bin/bash
export WINEPREFIX="$HOME/.wine"
ZELLO_PATH="$WINEPREFIX/drive_c/Program Files (x86)/Zello/Zello.exe"

if [ -f "$ZELLO_PATH" ]; then
    wine "$ZELLO_PATH"
else
    echo "Zello.exe not found in expected location."
    exit 1
fi

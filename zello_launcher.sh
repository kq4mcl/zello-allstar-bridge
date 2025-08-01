#!/bin/bash
WINEPREFIX="$HOME/.wine"
ZELLO_PATH="$WINEPREFIX/drive_c/Program Files (x86)/Zello/Zello.exe"

if [ -f "$ZELLO_PATH" ]; then
    wine "$ZELLO_PATH"
else
    echo "Zello not found. Make sure it's installed via install.sh"
fi

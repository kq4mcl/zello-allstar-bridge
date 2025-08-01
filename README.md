# zello-allstar-bridge (v1.5)

Two-way audio bridge between Zello and AllStarLink using Wine, ALSA loopback, and headless tools.

## Setup

```bash
chmod +x install.sh
./install.sh
```

After install:
1. Launch Zello manually with:
   ```bash
   wine ~/.wine/drive_c/Program\ Files\ \(x86\)/Zello/Zello.exe
   ```
2. Log in, configure audio to use **Loopback**, enable VOX.
3. Restart or run:
   ```bash
   sudo systemctl start zello.service
   ```

Zello will auto-start and bridge audio on every boot.

# zello-allstar-bridge v2.0

Fully headless Debian package to bridge Zello and AllStarLink audio using Wine and ALSA loopback.

## Features

- ✅ Auto-installs Zello with Wine
- ✅ Optional ASL 3.0 installation
- ✅ ALSA loopback + VOX handling
- ✅ Systemd auto-start for Zello
- ✅ Monitoring script restarts Zello if it crashes

## Installation

```bash
chmod +x install.sh
./install.sh
```

After installation:
1. Launch Zello once:
```bash
wine ~/.wine/drive_c/Program\ Files\ \(x86\)/Zello/Zello.exe
```
2. Log in and join your channel
3. In Zello:
   - Audio In: ALSA Loopback Capture
   - Audio Out: ALSA Loopback Playback
   - Enable VOX

Once logged in:
```bash
sudo systemctl start zello.service
```

Zello will now auto-launch on every boot. To monitor the bridge, optionally run `bridge-monitor.sh`.

## Notes

- AllStarLink install is optional
- Ensure loopback module is active on reboot

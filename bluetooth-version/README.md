# Raspberry Pi Bluetooth Audio Player (USB Bluetooth Version)

This version of the **Scanner Audio Player** streams live audio from a Uniden SDS200 (or similar scanner) to a Bluetooth speaker using a Raspberry Pi.  
It’s a plug‑and‑play build that starts automatically on boot and reconnects to your Bluetooth speaker.

---

## Signal Flow

📡 Uniden Scanner (via ProScan Server)
↓
🌐 Network Audio Stream (Your feed URL here)
↓
💻 Raspberry Pi (FFmpeg Service)
↓
🔊 Bluetooth Speaker (TEWELL T‑1)


---

## Hardware

| Component | Description |
|:-----------|:------------|
| **Raspberry Pi 4 / Pi 5** | Tested on Raspberry Pi OS Bookworm |
| **Bluetooth Adapter** | Kinivo BTD400 USB (Bluetooth 4.0 / CSR8510 A10 chipset) |
| **Speaker** | TEWELL T‑1 Bluetooth A2DP speaker |
| **Scanner Feed Software** | [ProScan](https://www.proscan.org) streaming server |
| **Stream URL** | Example: `http://<your-server-ip>:<port>/stream` |

---

## Installation

Run the included **installer script** to set up dependencies, copy files, and enable the service:

cd ~/scanner-audio-player/bluetooth-version
./install-bluetooth.sh


This script will:
- Install **FFmpeg**, **BlueZ**, **PulseAudio**, and **BlueZ‑Tools**
- Copy your playback script to `/usr/local/bin/`
- Install the **systemd user service** to `~/.config/systemd/user/`
- Enable *lingering* so the service runs automatically at boot
- Start the service immediately

---

## Configuration

Before using, edit both the playback script and the service file to include your own **audio stream URL**.

Open the playback script:

nano playstream-bluetooth.sh

and edit this line:
ffmpeg -reconnect 1 -reconnect_streamed 1 -reconnect_delay_max 5
-i http://<your-server-ip>:<port>/stream -f alsa default


Then open the service file:
nano streamplayer.service


and replace the input URL in the `ExecStart=` line with your server’s address.

Example:
ExecStart=/usr/bin/ffmpeg -hide_banner -reconnect 1 -reconnect_streamed 1
-reconnect_delay_max 5 -fflags +genpts -i http://192.168.1.50:8000/stream -f alsa default


---

## Bluetooth Playback Script

`playstream-bluetooth.sh` configures the Bluetooth sink and launches FFmpeg:

pactl set-default-sink bluez_output.XX_XX_XX_XX_XX_XX.a2dp-sink
ffmpeg -hide_banner -reconnect 1 -reconnect_streamed 1
-reconnect_delay_max 5 -i http://<your-server-ip>:<port>/stream -f alsa default


> Replace `XX:XX:XX:XX:XX:XX` with your Bluetooth speaker’s MAC address, and `<your-server-ip>` with your ProScan server’s IP and port.

---

## Systemd User Service

[Unit]
Description=FFmpeg Network Audio Stream Player (Bluetooth)
After=bluetooth.target sound.target network-online.target
Wants=bluetooth.target sound.target network-online.target

[Service]
Type=simple
ExecStartPre=/usr/bin/bluetoothctl connect XX:XX:XX:XX:XX:XX
ExecStart=/usr/bin/ffmpeg -hide_banner -reconnect 1 -reconnect_streamed 1
-reconnect_delay_max 5 -fflags +genpts -i http://<your-server-ip>:<port>/stream -f alsa default
Restart=always
RestartSec=5

[Install]
WantedBy=default.target


Reload and start:
systemctl --user daemon-reload
systemctl --user enable streamplayer.service
systemctl --user restart streamplayer.service


---

## Troubleshooting

- **No connection after reboot:**  
  Ensure the speaker is powered on and lingering is enabled:  
sudo loginctl enable-linger $USER


- **Check logs:**  
journalctl --user -u streamplayer.service -e


- **No sound?**  
Confirm the audio sink and Bluetooth connection:
bluetoothctl show
pactl list sinks short


---

## Credits

Project maintained by **Radioman260**  
Tested with **Kinivo BTD400** USB adapter and **TEWELL T‑1** speaker.  
Audio sourced via **ProScan Streaming Server** — [www.proscan.org](https://www.proscan.org).

---



# 🎧 Raspberry Pi Network Scanner Audio Player

This project provides a **reliable, always-on network audio stream player**
for Raspberry Pi using **FFmpeg + systemd**.

It was designed for **scanner radio feeds**, but works for any HTTP MP3 stream.

---

## ✅ Features

- Plays live HTTP MP3 streams
- Stable FFmpeg backend (no VLC)
- Automatic reconnect on stream loss
- Automatic restart on crashes
- Starts automatically on boot
- Proven to run overnight without intervention

---

## 🖥️ Tested Environment

- Raspberry Pi OS (Bookworm)
- FFmpeg 7.x
- Audio via 3.5mm headphone jack
- Raspberry Pi Zero / 3 / 4

---

## 📦 Installation (One Command)

```bash
git clone https://github.com/Radioman260/scanner-audio-player.git
cd scanner-audio-player
chmod +x install.sh
./install.sh

## ⚙️ Configuration

Open playstream.sh in a text editor:

nano ~/scanner-audio-player/playstream.sh


Find the line that contains the stream URL, e.g.:

STREAM_URL="http://192.168.0.45:5000/stream"


Replace it with your server’s IP and port, for example:

STREAM_URL="http://YOUR_SERVER_IP:PORT/stream"


Save the file (Ctrl+O in nano) and exit (Ctrl+X).

Start the service (or reboot to start automatically):

sudo systemctl start streamplayer.service


To check status:

sudo systemctl status streamplayer.service

## 📝 Notes

The systemd service automatically reconnects if the stream drops.

Audio output defaults to the Raspberry Pi headphone jack.

The script is designed to run reliably 24/7 on Raspberry Pi hardware.

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

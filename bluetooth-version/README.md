# Raspberry Pi Bluetooth Audio Player (USB Bluetooth Version)

This project uses a **Raspberry Pi**, a **USB Bluetooth adapter**, and **FFmpeg** to receive an SDS200 scanner audio stream and play it wirelessly to a Bluetooth speaker.

---

## Signal Flow

📡 Uniden SDS200 → 🌐 Proscan Server → 💻 Raspberry Pi (FFmpeg Service) → 🔊 TEWELL T‑1 Bluetooth Speaker

### Project Overview

This build is an enhanced version of the *wired audio* setup.  
Instead of routing audio through the Pi’s 3.5 mm jack, it delivers sound via a **Bluetooth A2DP connection**, powered by a reliable **Kinivo BTD400 USB Bluetooth adapter**.

The network audio stream originates from a **ProScan Streaming Server**  
([www.proscan.org](https://www.proscan.org)) running on the Uniden SDS200.  
The Raspberry Pi connects to this live feed using **FFmpeg** and routes it to the TEWELL T‑1 Bluetooth speaker.

It launches automatically at boot, reconnects after power cycles, and operates completely hands‑off once configured.

#!/bin/bash
set -e

echo "Installing Raspberry Pi Bluetooth Scanner Audio Player..."

# 1. Install dependencies
sudo apt update
sudo apt install -y ffmpeg bluez pulseaudio bluez-tools

echo "Dependencies installed."

# 2. Copy Bluetooth playback script to /usr/local/bin
echo "Installing playstream-bluetooth.sh..."
sudo cp playstream-bluetooth.sh /usr/local/bin/playstream-bluetooth.sh
sudo chmod +x /usr/local/bin/playstream-bluetooth.sh

# 3. Copy user-level systemd service
echo "Setting up user-level service..."
mkdir -p ~/.config/systemd/user/
cp streamplayer.service ~/.config/systemd/user/streamplayer.service

# 4. Reload systemd user manager and enable lingering
echo "Enabling lingering for user: $USER"
sudo loginctl enable-linger $USER

echo "Reloading and enabling systemd service..."
systemctl --user daemon-reload
systemctl --user enable streamplayer.service
systemctl --user restart streamplayer.service

echo "---------------------------------------------"
echo "Bluetooth streamplayer installation complete!"
echo "Check status with: systemctl --user status streamplayer.service"
echo "The service will now auto-start after reboot."

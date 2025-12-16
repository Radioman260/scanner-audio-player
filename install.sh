#!/bin/bash

set -e

echo "Installing FFmpeg scanner audio player..."

sudo apt update
sudo apt install -y ffmpeg

echo "Installing playstream.sh..."
sudo cp playstream.sh /usr/local/bin/playstream.sh
sudo chmod +x /usr/local/bin/playstream.sh

echo "Installing systemd service..."
sudo cp systemd/streamplayer.service /etc/systemd/system/streamplayer.service

echo "Reloading systemd..."
sudo systemctl daemon-reload
sudo systemctl enable streamplayer.service
sudo systemctl restart streamplayer.service

echo "Done."
echo "Check status with: systemctl status streamplayer.service"

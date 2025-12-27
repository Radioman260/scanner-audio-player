#!/bin/bash

STREAM_URL="http://192.168.0.45:5000/stream"

exec ffmpeg \
  -reconnect 1 \
  -reconnect_streamed 1 \
  -reconnect_delay_max 5 \
  -fflags +genpts+discardcorrupt+igndts \
  -analyzeduration 1M \
  -probesize 1M \
  -i "$STREAM_URL" \
  -vn \
  -f pulse \
  -ac 1 \
  -ar 22050 \
  -device bluez_sink.11_67_7E_F4_95_D3.a2dp_sink

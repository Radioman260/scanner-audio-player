
---

# 📄 playstream.sh

```bash
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
  -f alsa \
  -ac 1 \
  -ar 22050 \
  default

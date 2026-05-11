#!/usr/bin/env bash

set -eux
BITRATE_K=$(( (BITRATE_BPS + 999) / 1000 ))k
BUF_K=$(( ((BITRATE_BPS * 2) + 999) / 1000 ))k
VF="scale=trunc(iw/2)*2:trunc(ih/2)*2,format=yuv420p"
IN="./stock-no-audio.mp4"

/usr/bin/time -f "%e" \
ffmpeg \
  -y \
  -i "$IN" \
  -map 0:v:0 \
  -an \
  -vf "$VF" \
  -c:v mpeg4 \
  -b:v "$BITRATE_K" \
  -maxrate "$BITRATE_K" \
  -bufsize "$BUF_K" \
  './mpeg4.mp4'

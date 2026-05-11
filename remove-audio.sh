#!/usr/bin/env bash

ffmpeg \
  -y \
  -i stock.mp4 \
  -c:v copy \
  -an \
  'stock-no-audio.mp4'

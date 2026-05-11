#!/usr/bin/env bash

set -eux

ffprobe \
  -v error \
  -count_frames \
  -select_streams v:0 \
  -show_entries stream=nb_read_frames \
  -of default=noprint_wrappers=1:nokey=1 \
  'stock-no-audio.mp4'

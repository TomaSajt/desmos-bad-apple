#!/usr/bin/env bash
set -euo pipefail
cd $(dirname "${BASH_SOURCE[0]}")
mkdir -p build
cd build

VIDEO_URL="https://www.youtube.com/watch?v=FtutLA63Cp8"

echo "Downloading video"
yt-dlp $VIDEO_URL -f "bv" -o "video.%(ext)s"

echo "Separating frames"
rm -rf frames
mkdir -p frames
ffmpeg -i video.* "frames/%04d.bmp"

echo "Creating SVGs"
potrace -b svg frames/*.bmp

rm -rf svgs
mkdir -p svgs
mv frames/*.svg svgs

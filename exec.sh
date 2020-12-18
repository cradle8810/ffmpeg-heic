#!/bin/sh

if [ $# -ne 1 ]; then
  printf "usage : %s <filename>\n" "$0" > /dev/stderr
  exit 1
fi

# ffmpeg(1) failed if there is a period(.) output path.
# mktemp(1) creates a directory which name has a period.
#TMPDIR=$(mktemp)

ffmpeg \
  -i "$1" \
  -pix_fmt yuv420p \
  -codec:v libx265 \
  -crf 13 \
  -preset veryslow \
  -x265-params "info=0,ssim=1" \
  -vf scale="trunc(iw/2)*2:trunc(ih/2)*2" \
  -f hevc \
  "/tmp/out.hvc"

mp4box \
  -add-image "/tmp/out.hvc" \
  -ab heic \
  -new "$1.heic"

fileDate=$(stat -c "%y" "$1" | \
          tr -d ': -' | \
          cut -b -14 | \
          sed -e 's/\(.\{12\}\)/\1./g')

touch -t "${fileDate}" "$1.heic"

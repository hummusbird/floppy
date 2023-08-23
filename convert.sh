#!/bin/sh
# convert to 48k opus - linux

ffmpeg -i "$1" -c:a libopus -b:a 48k song.opus

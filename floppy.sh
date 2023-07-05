#!/bin/bash

path="/mnt/floppy/"
song="song.opus"

while true
do
  disk="$(lsblk --output NAME --exclude 259 --noheadings --noempty)"

  if [[ $disk != "sda" ]]; then
    echo "no disk inserted"
    sleep 2 

  elif [[ -f $path$song ]]; then
    echo "playing $path$song"
    ffplay "$path$song" -autoexit -nodisp
    wait
    sleep 1

  else
    echo "no song found"
    sleep 2
  fi
done

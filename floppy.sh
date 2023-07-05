#!/bin/bash

path="/mnt/floppy/"
song="song.opus"
drive="sdb"
chkdrive="lsblk --output NAME --include 8 --noheadings --noempty /dev/${drive}"


while true
do
  disk="$($chkdrive)"

  if [[ $disk != $drive ]]; then
    echo "no disk inserted"
    sleep 2 

  elif [[ -f $path$song ]]; then
    echo "playing $path$song"
    ffplay "$path$song" -hide_banner -loglevel error -autoexit -nodisp &

    while [[ "$($chkdrive)" == $drive ]]
    do
      sleep 0.2
      echo "playing..."
    done

    echo "disk removed!"
    pkill ffplay
    sleep 2

  else
    echo "no song found"
    sleep 2
  fi
done

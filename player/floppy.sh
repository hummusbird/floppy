#!/bin/bash

path="/mnt/floppy/"
song="song.opus"
drive="sda"
chkdrive="lsblk --output NAME --include 8 --noheadings /dev/${drive}"

while true
do
  disk="$($chkdrive)"

  if [[ $disk != $drive ]]; then
    echo "no disk!" | python ../lcd/displaytop.py & 
    sleep 2 

  elif [[ -f $path$song ]]; then
    echo "playing $path$song" | python ../lcd/scroll.py &
    ffplay "$path$song" -hide_banner -loglevel error -autoexit -nodisp &

    while [[ "$($chkdrive)" == $drive ]]
    do
      sleep 0.2
    done

    killall python
    echo "disk removed!" | python ../lcd/displaybottom.py &
    pkill ffplay
    sleep 2

  else
    echo "no song found" | python ../lcd/displaytop.py &
    sleep 2
  fi
done

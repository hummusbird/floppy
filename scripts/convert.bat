# convert to 48k opus - windows

ffmpeg.exe -i "%~1" -c:a libopus -b:a 48k song.opus

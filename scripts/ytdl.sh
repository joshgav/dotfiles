#! /usr/bin/env bash

# playlist_id=${1}
playlist_url="${1}"
parent_dir="${2}"

output_template='%(album)s/%(autonumber)d-%(title)s.%(ext)s'
output_template='%(artist)s/%(album)s-%(autonumber)d-%(title)s.%(ext)s'
output_template='%(title)s.%(ext)s'
ytdl='yt-dlp'

${ytdl} "${playlist_url}" \
    --extract-audio --audio-format mp3 \
    --cookies-from-browser chrome \
    --output ~/Music/${parent_dir:+"${parent_dir}/"}/${output_template}

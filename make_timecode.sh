#!/bin/bash

ffmpeg -stream_loop -1 -framerate 25 -pattern_type glob -i './*.png' \
	-c:v libx264 \
  	-preset veryfast \
  	-tune zerolatency \
  	-x264-params "bframes=0:keyint=25" \
  	-b:v 512k \
	-vf "scale=1024:768:force_original_aspect_ratio=decrease,fps=25,format=yuv420p,drawtext=fontfile=/opt/SpaceMonoNerdFontMono-Regular.ttf:text='%{pts\:hms}':fontcolor=white:fontsize=72:box=1:boxcolor=black@0.5:boxborderw=5:x=(w-text_w)-20:y=(h-text_h)-20" \
	-f image2 \
	-t 60 \
	'./frames/frame-%4d.h264'

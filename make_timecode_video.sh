#!/bin/bash

ffmpeg -stream_loop -1 -framerate 25 -pattern_type glob -i "../cam1/*.png" \
	-c:v libx264 \
	-vf "scale=1024:768:force_original_aspect_ratio=decrease,fps=10,format=yuv420p,drawtext=fontfile=/opt/SpaceMonoNerdFontMono-Regular.ttf:text='%{pts\:hms}':fontcolor=white:fontsize=64:box=1:boxcolor=black@0.5:boxborderw=5:x=(w-text_w)-20:y=(h-text_h)-20" \
	-t 60 \
	cam1.mp4

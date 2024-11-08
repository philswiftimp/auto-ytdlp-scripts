# auto-ytdlp-scripts
Several scripts I have created to automate and ease the use of running "yt-dlp" from the command line. It attempts to download the highest quality video or audio, depending on which script is run.

For example, if "Download-Video.bat" is run, it will usually download a max resolution of 720p, no higher. But if you instead run "Download-Video-Archive.bat" it will attempt to download the HIGHEST quality supported. Keep in mind that not every platform will provide the format the script asks for, in which case you should be able to use the "Download-Video.bat" script to grab a compatible format. This may be fixed in the future for my scripts, so post an Issue if you notice anything strange.

As well, if FFmpeg is provided, the script supports automatic remux into MP4 for video files. This is done by default if FFmpeg is provided, but this may change in the future if people demand it.




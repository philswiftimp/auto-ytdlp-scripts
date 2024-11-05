@echo off

echo Attempting to update yt-dlp...
echo.
echo.

yt-dlp.exe -U

echo.

echo Checking for Downloads Folder...

echo.

if exist "Downloads/" echo Found Downloads Folder!

echo.

if not exist "Downloads/" echo Downloads Folder Not Found! Creating Folder...
if not exist "Downloads/" mkdir "Downloads/"

echo.

:startover

set /p _url="Enter URL: "

yt-dlp %_url% -P "Downloads/" --ffmpeg-location "ffmpeg\bin\ffmpeg.exe" -f bestvideo[ext=webm]+bestaudio[ext=m4a] --remux-video "mp4"

echo.

goto :startover

pause

@echo off

if not exist "yt-dlp.exe" (
    echo First time run! Downloading from repository at: 'https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp.exe'...
    echo.

    curl -OL "https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp.exe"

    echo.

)

echo Attempting to update yt-dlp using -U option...
echo.
echo.


yt-dlp.exe -U

echo.
echo.
echo --------------------------------------------
echo.
echo.


echo Checking for FFmpeg...
echo.

if not exist "ffmpeg\bin\ffmpeg.exe" (
    echo FFmpeg binary not found. Script CANNOT continue, as FFmpeg is REQUIRED to extract only the audio from the download! Script will exit!
    echo.

    echo PLEASE PUT YOUR FFMPEG BINARIES INSIDE OF THE FFMPEG BIN FOLDER!!!!
    echo.

    pause
    exit
)

echo.
echo.
echo --------------------------------------------
echo.
echo.

echo Checking if Downloads folder exists...
echo.

if not exist "Downloads/" (
    echo Downloads folder does not exist, creating directory!

    echo.
    echo.

    mkdir "Downloads/"

    if not %errorlevel% == 0 (
        echo Downloads folder could NOT be created! Double check the location you are running this script from, and make sure you have file permissions!
        echo.
	)
)

if exist "Downloads/" (
    echo Downloads folder exists! Continuing along...
    echo.
)

echo.

:startover

echo --------------------------------------------
echo.
echo.

set /p _url="Enter URL: "

if exist "ffmpeg\bin\ffmpeg.exe" (
    yt-dlp %_url% -f 251/bestaudio[abr=320] -P "Downloads/" --ffmpeg-location "ffmpeg\bin\ffmpeg.exe" -f bestvideo+bestaudio/best --extract-audio --audio-format mp3
)

echo.
echo.

goto :startover

pause

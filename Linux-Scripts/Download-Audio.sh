#!/usr/bin/env bash

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

#If yt-dlp_linux is not found, download using wget from the GitHub repository
if [[ ! -e "yt-dlp_linux" ]]; then

    printf "${RED}yt-dlp_linux not found! Downloading from repository at: 'https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp_linux'...\n\n\n${NC}"

    sleep 2

    wget "https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp_linux"

    chmod +x "yt-dlp_linux"
fi

#Attempt to update yt-dlp via the included update parameter, it's easier on the eyes.
printf "${GREEN}\nAttempting to update yt-dlp...\n\n${NC}"

#Run YT-DLP's Executable With the Update Parameter
./yt-dlp_linux -U

#Formatting
printf "\n${NC}"
echo "--------------------------------------------"

#Check if FFmpeg is in the right location
printf "${GREEN}\nChecking for FFmpeg...\n${NC}"

if [[ ! -e "./FFmpeg/ffmpeg" ]]; then
    printf "${RED}\nFFmpeg binary not found. Script CANNOT continue, as FFmpeg is REQUIRED to extract only the audio from the download! Script will exit!\n"
    printf "\nPLEASE PUT YOUR FFMPEG BINARIES INSIDE OF THE FFMPEG FOLDER!!!!\n\n${NC}"

    echo "--------------------------------------------"

    printf "\nScript has stopped. You can close the terminal window or stop execution now.\n\n${NC}"

    exit
fi

#Formatting
printf "\n${NC}"
echo "--------------------------------------------"

printf "${GREEN}\nChecking if Downloads folder exists...\n\n"

if [[ -e "Downloads/" ]]; then
    printf "${GREEN}Downloads folder exists! Continuing along...\n"
else
    printf "${RED}Downloads folder does not exist, creating directory!\n"

    if mkdir -p "Downloads"; then
        printf "${GREEN}Downloads folder created successfully!\n"
    else
        printf "${RED}Downloads folder unable to be created! Check if you have the right permissions for this folder!\n"
    fi
fi

while true; do

    #Formatting
    printf "\n${NC}"
    echo "--------------------------------------------"
    printf "\n${NC}"

    #Formatting
    echo -e "${NC}[ Download MP3 ]"
    printf "\n"

    #Enter your URL for Downloading
    echo -n -e "${NC}Enter URL: "
    read -r _URL

    #Formatting
    printf "\n"

    ./yt-dlp_linux $_URL -f 251/bestaudio[abr=320] -P "Downloads/" --ffmpeg-location "./FFmpeg/ffmpeg" --extract-audio --audio-format mp3

done





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

#Check if FFmpeg is in the right location
printf "${GREEN}\nChecking for FFmpeg...\n${NC}"

if [[ ! -e "./FFmpeg/ffmpeg" ]]; then
    printf "${RED}\nFFmpeg binary not found. Script will not continue.\n"
    printf "\nPLEASE PUT YOUR FFMPEG BINARIES INSIDE OF THE FFMPEG FOLDER!!!!\n"

    exit
fi

#Formatting
printf "\n"
echo "--------------------------------------------"

printf "${GREEN}\nChecking if Downloads folder exists...\n\n"

if [[ -e "Downloads/" ]]; then
    printf "${GREEN}Downloads folder exists! Continuing along...\n\n"
else
    printf "${RED}Downloads folder does not exist, creating directory!\n\n"

    if mkdir -p "Downloads"; then
        printf "${GREEN}Downloads folder created successfully!\n\n"
    else
        printf "${RED}Downloads folder unable to be created! Check if you have the right permissions for this folder!\n\n"
    fi
fi

while true; do

#Formatting
echo -e "${NC}[ Download Highest Quality MP4 Video ]"
printf "\n"

#Enter your URL for Downloading
echo -n -e "${NC}Enter URL: "
read -r _URL

#Formatting
printf "\n"

./yt-dlp_linux $_URL -P "Downloads/" --ffmpeg-location "./FFmpeg/ffmpeg" -f bestvideo[ext=webm]+bestaudio[ext=m4a] --remux-video "mp4"

#Formatting
printf "\n"

done





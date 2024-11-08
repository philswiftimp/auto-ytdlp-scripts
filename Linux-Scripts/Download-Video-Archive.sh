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
    printf "${RED}\nFFmpeg binary not found. Script will continue without it, but you should download the binaries for merging and remux support.\n"
    printf "\nPLEASE PUT YOUR FFMPEG BINARIES INSIDE OF THE FFMPEG FOLDER!!!!\n"

    #exit
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
    echo -e "${NC}[ Download Highest Quality MP4 Video ]"
    printf "\n"

    #Enter your URL for Downloading
    echo -n -e "${NC}Enter URL: "
    read -r _URL

    #Formatting
    printf "\n"

    if [[ ! -e "./FFmpeg/ffmpeg" ]]; then
        ./yt-dlp_linux $_URL -P "Downloads/" -f bestvideo[ext=webm]+bestaudio[ext=m4a]
    else
        ./yt-dlp_linux $_URL -P "Downloads/" --ffmpeg-location "./FFmpeg/ffmpeg" -f bestvideo[ext=webm]+bestaudio[ext=m4a] --remux-video "mp4"
    fi



done





#!/bin/bash

# PACKAGES TO INSTALL ***************************************************************************************
PACKAGES_TO_INSTALL="wget dialog binutils coreutils jq snapd ffmpeg fprobe webp pandoc"
# ***********************************************************************************************************

install_on_debian() {
    su -c "apt update && apt install ${PACKAGES_TO_INSTALL} -y && snap install core yt-dlp"
}

clear
dist=$(lsb_release -a 2>&1 | grep -w "Distributor ID" | cut -d":" -f2 | xargs)

echo ""
echo "Initialising..."
echo ""

case "$dist" in
    "Debian") install_on_debian;;
    *) echo "Linux distribution could not be determined."; exit 1;;
esac


# su -c "apt update && apt install wget dialog binutils coreutils jq yt-dlp ffmpeg fprobe webp pandoc"
#!/bin/bash

# PACKAGES TO INSTALL ***************************************************************************************
PACKAGES_TO_INSTALL="wget dialog binutils coreutils jq snapd ffmpeg fprobe webp pandoc"
# ***********************************************************************************************************

install_on_debian() {
    su -c "apt update && apt install ${PACKAGES_TO_INSTALL} -y && snap install core yt-dlp"
}

install_on_fedora() {
    sudo dnf install \
    https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
    https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y

    sudo dnf update -y
    sudo dnf install ${PACKAGES_TO_INSTALL} -y
    sudo ln -s /var/lib/snapd/snap /snap
    sudo snap install core yt-dlp
}

clear
dist=$(cat "/etc/os-release" | grep -w "ID" | cut -d= -f2 | xargs)

echo ""
echo "Initialising..."
echo ""

case "$dist" in
    "debian") install_on_debian;;
    "fedora") install_on_fedora;;
    *) echo "Linux distribution could not be determined."; exit 1;;
esac


# su -c "apt update && apt install wget dialog binutils coreutils jq yt-dlp ffmpeg fprobe webp pandoc"
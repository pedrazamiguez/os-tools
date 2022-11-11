#!/bin/bash

# PACKAGES TO INSTALL ***************************************************************************************
PACKAGES_TO_INSTALL="wget dialog binutils coreutils jq yt-dlp ffmpeg fprobe webp pandoc"
# ***********************************************************************************************************

check_brew_installation() {
    which -s brew
    if [[ $? != 0 ]]
    then
        echo "Installing homebrew..."
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        echo "Installing homebrew... DONE!"
    else
        # Homebrew is installed. 
        # Check if it's been a while since it's not updated.
        packages_updated_recently=$(find $(brew --repository)/Library/Taps/homebrew/homebrew-core/Formula -type f -name "*.rb" -mtime -24h | wc -l)
        if [ 0 -eq $packages_updated_recently ]
        then
            echo "Updating homebrew packages..."
            brew update
            echo "Updating homebrew packages... DONE!"
            echo "Upgrading homebrew packages..."
            brew upgrade
            echo "Upgrading homebrew packages... DONE!"
        else
            echo "Skipping homebrew packages update..."
        fi
    fi
}

install_packages() {
    already_installed_packages=$(brew list -1)
    for package in $PACKAGES_TO_INSTALL
    do
        if ! [ $(echo "$already_installed_packages" | grep -w "${package}") ]
        then
            echo "Installing ${package}..."
            brew install $package > /dev/null 2>&1
            echo "Installing ${package}... DONE!"
        fi
    done
}

clear
echo ""
echo "Initialising..."
echo ""
check_brew_installation
install_packages

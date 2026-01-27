#!/bin/bash

# Author: Kalbskinder
# Created on: Jan 27 2026
# Last modified: Jan 27 2026
#
# Usage:
# - chmod +x setup.sh
# - ./setup.sh


# Verify if fastfetch is installed
check_fastfetch() {
    if ! command -v fastfetch &> /dev/null; then
        echo "Fastfetch is not installed."
        echo "You can install it on Ubuntu with:"
        echo "  sudo apt install fastfetch"
        exit 1
    fi
}

echo "Verifying fastfetch installation..."
check_fastfetch

echo "Setting up Fastfetch configuration..."
git clone https://github.com/Kalbskinder/fastfetch.git fastfetch-setup

mkdir -p ~/.config/fastfetch/

# Copy github config to users config folder
# Delete github folder afterwards
cp fastfetch-setup/config.jsonc ~/.config/fastfetch/
rm -rf fastfetch-setup/

# Run fastfetch command to display new config
fastfetch

echo "Successfully set up Ubuntu Fastfetch config!"


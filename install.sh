#!/bin/bash

# LookPositive installer and updater script
#
# Made by QuinceTart10

if [ ! -d ~/.local/share/icons ]; then
    mkdir ~/.local/share/icons
fi
cd ~/.local/share/icons
if [ -d ~/.icons/LookPositive ]; then
    echo '[✗] Unsupported install location detected'
    read -p "[?] Do you want to delete it and continue? [y/N] " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        rm -r ~/.icons/LookPositive
    else
        echo '[✗] Cannot continue, please manually remove ~/.icons/LookPositive and rerun the script'
    fi
elif [ -d ~/.local/share/icons/LookPositive ] && [ ! -d ~/.local/share/icons/LookPositive/.git ]; then
    echo '[✗] Unsupported install method detected'
    read -p "[?] Do you want to delete it and continue? [y/N] " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        rm -r ~/.local/share/icons/LookPositive
    else
        echo '[✗] Cannot continue, please manually remove ~/.local/share/icons/LookPositive and rerun the script'
    fi
elif [ -d ~/.local/share/icons/LookPositive/.git ]; then
    echo '[-] Updating LookPositive...'
    cd ./LookPositive
    git fetch
    if [ ! $? = 0 ]; then
        echo '[✗] Uh oh, something went wrong.'
    fi
    git pull
    if [ $? = 0 ]; then
        echo '[✓] Updated successfully!'
    else
        echo '[✗] Uh oh, something went wrong.'
    fi
fi
if [ ! -d ~/.local/share/icons/LookPositive/.git ]; then
    echo '[-] Installing LookPositive...'
    git clone https://github.com/0penByte/LookPositive.git
    if [ $? = 0 ]; then
        echo '[✓] Installed successfully!'
    else
        echo '[✗] Uh oh, something went wrong.'
    fi
fi

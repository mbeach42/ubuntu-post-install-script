#!/bin/sh

# Antergos post-install script 
# By Matthew Beach


# Update packages
yaourt -Syyuu

# Install pacaur
yaourt -S pacaur

# Install applications
pacaur -S git dropbox
pacaur -S slack-desktop
pacaur -S gitkraken sublime-text 
pacaur -S texlive-2017
pacaur -S i3-gaps-git
pacman -S dmenu
pacman -S opera
#!/bin/bash

# Terminal colors
BLACK='\033[0;30m'
DARK_GRAY='\033[1;30m'
RED='\033[0;31m'
LIGHT_RED='\033[1;31m'
GREEN='\033[0;32m'
LIGHT_GREEN='\033[1;32m'
ORANGE='\033[0;33m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
LIGHT='\033[1;34m'
PURPLE='\033[0;35m'
LIGHT_PURPLE='\033[1;35m'
CYAN='\033[0;36m'
LIGHT_CYAN='\033[1;36m'
LIGHT_GRAY='\033[0;37m'
WHITE='\033[1;37m'
RESET='\033[0m'

# Clear the terminal and display a welcome message
clear
sudo ls
clear
echo "Hello! :)"
echo "Installing everything in 10 seconds, hit CTRL+C to exit..."
sleep 10
clear

# Install yay the AUR helper (needed for some packages)
yes | sudo pacman -S --needed base-devel git
git clone https://aur.archlinux.org/yay.git
cd yay
yes | makepkg -si
cd
rm -rf ~/yay
clear

# Install alacritty & other packages
yes | sudo pacman -S neofetch alacritty net-tools nmap ufw zip unzip picom rofi feh polybar ttf-font-awesome dunst libnotify
clear

# Install fonts
wget https://isabellagibson.github.io/arch/assets/fonts.zip -O ~/fonts.zip
sudo unzip ~/fonts.zip /usr/share/fonts/
rm ~/fonts.zip

# Set wallpaper
mkdir ~/Pictures
mkdir ~/Pictures/Wallpapers
wget https://isabellagibson.github.io/arch/assets/wallpaper.png -O ~/Pictures/Wallpapers/arch.png

# Download/replace config files
mkdir ~/.config/i3
mkdir ~/.config/polybar
mkdir ~/.config/neofetch
mkdir ~/.config/rofi
mkdir ~/.config/alacritty
wget https://isabellagibson.github.io/arch/config/i3_config -O ~/.config/i3/config
wget https://isabellagibson.github.io/arch/config/polybar_config -O ~/.config/polybar/config
wget https://isabellagibson.github.io/arch/config/polybar_launch.sh -O ~/.config/polybar/launch.sh
wget https://isabellagibson.github.io/arch/config/neofetch_config.conf -O ~/.config/neofetch/config.conf
wget https://isabellagibson.github.io/arch/config/config.rasi -O ~/.config/rofi/config.rasi
wget https://isabellagibson.github.io/arch/config/alacritty.yml -O ~/.config/alacritty/alacritty.yml
chmod +x ~/.config/polybar/launch.sh

# Install spotify
yes | yay -S spotify

# Replace bashrc
sudo wget https://isabellagibson.github.io/arch/bashrc -O ~/.bashrc

# Reboot!
clear
DISPLAY=xrandr -q | grep " connected" | cut -d ' ' -f1
echo "Found $DISPLAY"
sleep 5
sudo reboot now
#!/bin/bash

# Terminal colors
BLACK = '\033[0;30m'
DARK_GRAY = '\033[1;30m'
RED = '\033[0;31m'
LIGHT_RED = '\033[1;31m'
GREEN = '\033[0;32m'
LIGHT_GREEN = '\033[1;32m'
ORANGE = '\033[0;33m'
YELLOW = '\033[1;33m'
BLUE = '\033[0;34m'
LIGHT = '\033[1;34m'
PURPLE = '\033[0;35m'
LIGHT_PURPLE = '\033[1;35m'
CYAN = '\033[0;36m'
LIGHT_CYAN = '\033[1;36m'
LIGHT_GRAY = '\033[0;37m'
WHITE = '\033[1;37m'
RESET = '\033[0m'

# Clear the terminal and display a welcome message
sudo ls
clear
echo -f "${LIGHT_CYAN}Hello! :)${RESET}"
echo -f "Installing everything in 10 seconds, hit CTRL+C to exit..."
sleep 10
clear

# Install yay the AUR helper (needed for some packages)
sudo pacman -S --needed base-devel git
git clone https://aur.archlinux.org/yay.git
cd yay
yes | makepkg -si

# Install alacritty & other packages
sudo pacman -S neofetch vim alacritty net-tools nmap ufw zip unzip picom rofi feh polybar

# Install fonts
sudo wget https://isabellagibson.github.io/arch/assets/Raleway-Light.ttf -O /usr/share/fonts/Raleway-Light.ttf

# Set wallpaper
mkdir Pictures
mkdir Pictures/Wallpapers
wget https://isabellagibson.github.io/arch/assets/wallpaper.png -O ~/Pictures/Wallpapers/arch.png
feh --bg-fill ~/Pictures/Wallpapers/arch.png

# Download/replace config files
sudo wget https://isabellagibson.github.io/arch/config/i3_config -O ~/.config/i3/config
sudo wget https://isabellagibson.github.io/arch/config/polybar_config -O ~/.config/polybar/config
sudo wget https://isabellagibson.github.io/arch/config/i3_config -O ~/.config/neofetch/config.conf

sudo reboot now
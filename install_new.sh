#!/bin/bash

# Clear the terminal and display a welcome message
clear
echo "Root access is needed for this script. Please enter your password below."
sudo ls
clear
echo "Hello! :)"
echo "Installing everything in 10 seconds, hit CTRL+C to exit..."
sleep 10
clear

# Install alacritty & other packages
echo "Installing packages..."
yes | sudo pacman -S neofetch alacritty net-tools nmap ufw zip unzip picom rofi feh polybar ttf-font-awesome brave-browser
clear

# Install yay the AUR helper (needed for some packages)
yes | sudo pacman -S --needed base-devel git
git clone https://aur.archlinux.org/yay.git
cd yay
yes | makepkg -si
cd
rm -rf ~/yay
clear

# Install fonts
echo "Installing fonts..."
sudo wget https://isabellagibson.github.io/arch/assets/Raleway-SemiBold.ttf -O /usr/share/fonts/RalewaySemiBold.ttf
sudo wget https://isabellagibson.github.io/arch/assets/Raleway-Regular.ttf -O /usr/share/fonts/RalewayRegular.ttf
clear

# Set wallpaper
echo "Downloading the wallpaper..."
mkdir -p ~/Pictures/Wallpapers
wget https://isabellagibson.github.io/arch/assets/wallpaper.png -O ~/Pictures/Wallpapers/arch.png
clear

# Download/replace config files
echo "Grabbing config files..."
mkdir ~/.config/polybar
wget https://isabellagibson.github.io/arch/config/polybar_config -O ~/.config/polybar/config
wget https://isabellagibson.github.io/arch/config/polybar_launch.sh -O ~/.config/polybar/launch.sh

mkdir ~/.config/i3
wget https://isabellagibson.github.io/arch/config/i3_config -O ~/.config/i3/config

mkdir ~/.config/neofetch
wget https://isabellagibson.github.io/arch/config/neofetch_config.conf -O ~/.config/neofetch/config.conf

mkdir ~/.config/rofi
wget https://isabellagibson.github.io/arch/config/config.rasi -O ~/.config/rofi/config.rasi
# mkdir ~/.config/alacritty
# wget https://isabellagibson.github.io/arch/config/alacritty.yml -O ~/.config/alacritty/alacritty.yml
chmod +x ~/.config/polybar/launch.sh
clear

# Install spotify
yes | yay -S spotify

# Replace bashrc
sudo wget https://isabellagibson.github.io/arch/bashrc -O ~/.bashrc

# Reboot!
clear
DISPLAY=$(xrandr -q | grep " connected" | cut -d ' ' -f1)
echo "Found $DISPLAY"
sleep 5
sudo reboot now
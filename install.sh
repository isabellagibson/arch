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
yes | sudo pacman -S neofetch
yes | sudo pacman -S alacritty
yes | sudo pacman -S net-tools
yes | sudo pacman -S nmap
yes | sudo pacman -S ufw
yes | sudo pacman -S zip
yes | sudo pacman -S unzip
yes | sudo pacman -S picom
yes | sudo pacman -S rofi
yes | sudo pacman -S feh
yes | sudo pacman -S polybar
yes | sudo pacman -S ttf-font-awesome
yes | sudo pacman -S dunst
yes | sudo pacman -S libnotify
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
wget https://isabellagibson.github.io/arch/config/polybar.ini -O ~/.config/polybar/config
wget https://isabellagibson.github.io/arch/config/polybar_launch.sh -O ~/.config/polybar/launch.sh
chmod +x ~/.config/polybar/launch.sh

mkdir ~/.config/i3
wget https://isabellagibson.github.io/arch/config/i3_config -O ~/.config/i3/config

mkdir ~/.config/neofetch
wget https://isabellagibson.github.io/arch/config/neofetch_config.conf -O ~/.config/neofetch/config.conf

mkdir ~/.config/rofi
wget https://isabellagibson.github.io/arch/config/config.rasi -O ~/.config/rofi/config.rasi

mkdir ~/.config/picom
wget https://isabellagibson.github.io/arch/config/picom.conf -O ~/.config/picom/picom.conf
# mkdir ~/.config/alacritty
# wget https://isabellagibson.github.io/arch/config/alacritty.yml -O ~/.config/alacritty/alacritty.yml
clear

# Install spotify
yes | yay -S spotify

# Replace bashrc
sudo wget https://isabellagibson.github.io/arch/bashrc -O ~/.bashrc

# Reboot!
clear
DISPLAY=$(xrandr -q | grep " connected" | cut -d ' ' -f1)
echo "Found display $DISPLAY"
sleep 10
sudo reboot now
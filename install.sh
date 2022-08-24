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
for package in "neofetch alacritty net-tools ufw zip unzip rofi feh polybar nemo coreutils inetutils discord nmap ttf-font-awesome ttf-fira-code playerctl rofi-emoji picom dunst libnotify yt-dlp ffmpeg python-pip gnome-keyring man-db gnu-free-fonts"; do
    yes | sudo pacman -S --needed $package
    clear
done

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
echo "Downloading wallpapers..."
mkdir -p ~/Pictures
cd ~/Pictures
wget https://isabellagibson.github.io/arch/assets/Wallpapers.zip -O Wallpapers.zip
unzip Wallpapers.zip
rm Wallpapers.zip
cd
clear

# Download/replace config files
echo "Grabbing config files..."

mkdir ~/.config/polybar
wget https://isabellagibson.github.io/arch/config/polybar.ini -O ~/.config/polybar/config.ini
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

mkdir -p ~/.config/Code/User
wget https://isabellagibson.github.io/arch/config/vsc_settings.json -O ~/.config/Code/User/settings.json

mkdir -p ~/.config/dunst
wget https://isabellagibson.github.io/arch/config/dunstrc -O ~/.config/dunst/dunstrc

mkdir ~/.config/alacritty
wget https://isabellagibson.github.io/arch/config/alacritty.yml -O ~/.config/alacritty/alacritty.yml
clear

sudo wget https://isabellagibson.github.io/arch/bashrc -O ~/.bashrc
clear

echo "Installing AUR packages..."
yes | yay -S spotify
yes | yay -S visual-studio-code-bin
yes | yay -S grub-customizer
yes | yay -S github-desktop-bin
yes | yay -S brave-bin
clear

echo "Last step! Changing GRUB theme..."
cd
wget https://isabellagibson.github.io/arch/assets/grub-themes.zip
unzip grub-themes.zip
cd grub-themes/
sudo bash install.sh
cd
rm -rf grub-themes.zip grub-themes/
clear

# Reboot!
DISPLAY=$(xrandr -q | grep " connected" | cut -d ' ' -f1)
echo "Found display $DISPLAY"
sleep 5
sudo reboot now
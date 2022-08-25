#!/bin/bash

# Clear the terminal and display a welcome message
clear
echo "Root access is needed for this script. Please enter your password below."
sudo ls
clear
echo "Hello! :)"
echo "Installing everything in 10 seconds, hit CTRL+C to exit..."
sleep 10
sudo pacman -Syy
clear

# Install alacritty & other packages
echo "Installing packages..."
yes | sudo pacman -S --needed base-devel git
for package in "neofetch" "alacritty" "net-tools" "ufw" "zip" "unzip" "rofi" "feh" "polybar" "nemo" "coreutils" "inetutils" "discord" "nmap" "ttf-font-awesome" "ttf-fira-code" "ffmpeg" "playerctl" "rofi-emoji" "picom" "dunst" "libnotify" "yt-dlp" "python-pip" "man-db" "xsel" "xclip" "xdotool" "rust" "p7zip"
do
    echo "Installing $package"
    sleep 1
    yes | sudo pacman -S $package
done

# Install yay the AUR helper (needed for some packages)
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

mkdir -p ~/.config/polybar/scripts
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

sudo wget https://isabellagibson.github.io/arch/bashrc -O ~/.bashrc

wget https://isabellagibson.github.io/arch/config/get_spotify_status.sh -O ~/.config/polybar/scripts/get_spotify_status.sh
wget https://isabellagibson.github.io/arch/config/scroll_spotify_status.sh -O ~/.config/polybar/scripts/scroll_spotify_status.sh
chmod +x ~/.config/polybar/scripts/get_spotify_status.sh
chmod +x ~/.config/polybar/scripts/scroll_spotify_status.sh

mkdir -p ~/.local/bin
sudo wget https://isabellagibson.github.io/arch/config/powermenu -O ~/.local/bin/powermenu
sudo chmod +x ~/.local/bin/powermenu

sudo wget https://isabellagibson.github.io/arch/config/power.rasi -O /usr/share/rofi/themes/powermenu.rasi
sudo chmod 777 /usr/share/rofi/themes/powermenu.rasi

cd ~/.config
wget https://isabellagibson.github.io/arch/config/spt.zip -O spt.zip
clear
7z x spt.zip
sleep 10
rm spt.zip
cd

clear

echo "Installing AUR packages..."
# Dependencies
yes | yay -S gnome-keyring
yes | yay -S gnu-free-fonts
yes | yay -S ttf-apple-emoji
clear

# Apps
yes | yay -S spotify
yes | yay -S visual-studio-code-bin
yes | yay -S grub-customizer
yes | yay -S github-desktop-bin
yes | yay -S brave-bin
yes | yay -S spotifyd
yes | yay -S spotify-tui
yes | yay -S zscroll-git
clear

echo "Enabling system services..."
sudo systemctl enable sshd
sudo systemctl enable spotifyd
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
echo "Found display $DISPLAY, rebooting in 5 seconds..."
sleep 5
sudo reboot now
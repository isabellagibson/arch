#!/bin/bash

yes | sudo pacman -S p7zip
clear
echo "Downloading SPT config..."
cd ~/.config
wget https://isabellagibson.github.io/arch/config/spt.zip
clear
7z x -aoa spt.zip
sleep 1
rm spt.zip
cd
clear

# Set wallpaper
echo "Downloading wallpapers..."
mkdir -p ~/Pictures
cd ~/Pictures
wget https://isabellagibson.github.io/arch/assets/Wallpapers.zip
unzip -o Wallpapers.zip
rm Wallpapers.zip
cd
clear

# Clear the terminal and display a welcome message
echo "Root access is needed for this script. Please enter your password below."
sudo ls
clear
echo "Hello! :)"
echo "Installing everything in 3 seconds, hit CTRL+C to exit..."
sleep 3
sudo pacman -Syy
clear

# Install alacritty & other packages
echo "Installing packages..."
sudo pacman -S --noconfirm base-devel git
for package in "neofetch" "alacritty" "net-tools" "ufw" "zip" "unzip" "rofi" "feh" "polybar" "nemo" "coreutils" "inetutils" "discord" "nmap" "ttf-font-awesome" "ttf-fira-code" "ffmpeg" "playerctl" "rofi-emoji" "picom" "dunst" "libnotify" "yt-dlp" "python-pip" "man-db" "xsel" "xclip" "xdotool" "rust" "networkmanager" "virtualbox"
do
    echo "Installing $package"
    sleep 1
    yes | sudo pacman -S $package
    clear
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

# Download/replace config files
echo "Grabbing config files..."

mkdir -p ~/.config/polybar/scripts
wget https://isabellagibson.github.io/arch/config/polybar/config.ini -O ~/.config/polybar/config.ini
wget https://isabellagibson.github.io/arch/config/polybar/launch.sh -O ~/.config/polybar/launch.sh
chmod +x ~/.config/polybar/launch.sh

mkdir ~/.config/i3
wget https://isabellagibson.github.io/arch/config/i3/config -O ~/.config/i3/config

mkdir ~/.config/neofetch
wget https://isabellagibson.github.io/arch/config/neofetch/config.conf -O ~/.config/neofetch/config.conf

mkdir ~/.config/rofi
wget https://isabellagibson.github.io/arch/config/rofi/config.rasi -O ~/.config/rofi/config.rasi

mkdir ~/.config/picom
wget https://isabellagibson.github.io/arch/config/picom/picom.conf -O ~/.config/picom/picom.conf

mkdir -p ~/.config/Code/User
wget https://isabellagibson.github.io/arch/config/Code/User/settings.json -O ~/.config/Code/User/settings.json

mkdir -p ~/.config/dunst
wget https://isabellagibson.github.io/arch/config/dunst/dunstrc -O ~/.config/dunst/dunstrc

mkdir ~/.config/alacritty
wget https://isabellagibson.github.io/arch/config/alacritty/alacritty.yml -O ~/.config/alacritty/alacritty.yml

sudo wget https://isabellagibson.github.io/arch/bashrc -O ~/.bashrc

wget https://isabellagibson.github.io/arch/config/polybar/scripts/get_spotify_status.sh -O ~/.config/polybar/scripts/get_spotify_status.sh
wget https://isabellagibson.github.io/arch/config/polybar/scripts/scroll_spotify_status.sh -O ~/.config/polybar/scripts/scroll_spotify_status.sh
chmod +x ~/.config/polybar/scripts/get_spotify_status.sh
chmod +x ~/.config/polybar/scripts/scroll_spotify_status.sh

mkdir -p ~/.local/bin
sudo wget https://isabellagibson.github.io/arch/local/bin/powermenu -O ~/.local/bin/powermenu
sudo chmod +x ~/.local/bin/powermenu
sudo wget https://isabellagibson.github.io/arch/config/powermenu.rasi -O /usr/share/rofi/themes/powermenu.rasi
sudo chmod 777 /usr/share/rofi/themes/powermenu.rasi
sudo wget https://isabellagibson.github.io/arch/local/bin/changeres -O ~/.local/bin/changeres
sudo chmod +x ~/.local/bin/changeres
clear


echo "Installing AUR packages..."
# Dependencies
yes | yay -S gnome-keyring
yes | yay -S gnu-free-fonts
yes | yay -S ttf-apple-emoji
clear

# Apps
yes | yay -S fm6000
yes | yay -S bashtop
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
sudo systemctl enable NetworkManager
clear

# echo "Last step! Changing GRUB theme..."
# cd
# wget https://isabellagibson.github.io/arch/assets/grub-themes.zip
# unzip grub-themes.zip
# cd grub-themes/
# sudo bash install.sh
# cd
# rm -rf grub-themes.zip grub-themes/
# clear

# Reboot!
DISPLAY=$(xrandr -q | grep " connected" | cut -d ' ' -f1)
echo "Detected displays:"
echo $DISPLAY
sleep 10
sudo reboot now
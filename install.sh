#!/bin/bash

clear
sudo pacman -S --noconfirm p7zip unzip
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
for package in "neofetch" "alacritty" "net-tools" "ufw" "zip" "rofi" "feh" "polybar" "nemo" "coreutils" "inetutils" "discord" "nmap" "ttf-font-awesome" "ttf-fira-code" "ffmpeg" "playerctl" "rofi-emoji" "picom" "dunst" "libnotify" "yt-dlp" "python-pip" "man-db" "xsel" "xclip" "xdotool" "rust" "networkmanager" "virtualbox"
do
    echo "Installing $package"
    sleep 1
    yes | sudo pacman -S --noconfirm $package
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
for package in "gnome-keyring" "gnu-free-fonts" "fm6000" "bashtop" "visual-studio-code-bin" "grub-customizer" "github-desktop-bin" "brave-bin" "spotifyd" "spotify-tui" "zscroll-git" "ttf-apple-emoji"; do
    echo "Installing $package via yay"
    yes | yay -S $package
    clear
done
clear

echo "Enabling system services..."
for service in "sshd" "spotifyd" "NetworkManager"; do
    sudo systemctl enable $service
done
clear

echo "Downloading extensions for VS Code..."
for ext in "monokai.theme-monokai-pro-vscode" "ms-python.python" "ms-python.vscode-pylance" "ms-toolsai.jupyter" "ms-toolsai.jupyter-keymap" "ms-toolsai.jupyter-renderers" "ms-vscode-remote.remote-ssh" "ms-vscode-remote.remote-ssh-edit" "PKief.material-icon-theme" "ritwickdey.LiveServer" "flesler.url-encode"; do
    code --install-extension $ext
done
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
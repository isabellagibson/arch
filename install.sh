#!/bin/bash

BASE_URL="https://isabellagibson.github.io/arch"

clear
sudo pacman -S --noconfirm p7zip unzip
echo "Downloading SPT config..."
cd ~/.config
wget $BASE_URL/config/spt.zip
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
wget $BASE_URL/assets/Wallpapers.zip
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
for package in "neofetch" "alacritty" "net-tools" "ufw" "zip" "rofi" "feh" "polybar" "nemo" "coreutils" "inetutils" "discord" "nmap" "ttf-font-awesome" "ttf-fira-code" "ffmpeg" "playerctl" "rofi-emoji" "picom" "dunst" "libnotify" "yt-dlp" "python-pip" "man-db" "xsel" "xclip" "xdotool" "rust" "networkmanager" "virtualbox" "sddm" "mpv" "maim"
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
sudo wget $BASE_URL/assets/Raleway-SemiBold.ttf -O /usr/share/fonts/RalewaySemiBold.ttf
sudo wget $BASE_URL/assets/Raleway-Regular.ttf -O /usr/share/fonts/RalewayRegular.ttf
clear

# Download/replace config files
echo "Grabbing config files..."

mkdir -p ~/.config/polybar/scripts
wget $BASE_URL/config/polybar/config.ini -O ~/.config/polybar/config.ini
wget $BASE_URL/config/polybar/launch.sh -O ~/.config/polybar/launch.sh
chmod +x ~/.config/polybar/launch.sh

mkdir ~/.config/i3
wget $BASE_URL/config/i3/config -O ~/.config/i3/config

mkdir ~/.config/neofetch
wget $BASE_URL/config/neofetch/config.conf -O ~/.config/neofetch/config.conf

mkdir ~/.config/rofi
wget $BASE_URL/config/rofi/config.rasi -O ~/.config/rofi/config.rasi

mkdir ~/.config/picom
wget $BASE_URL/config/picom/picom.conf -O ~/.config/picom/picom.conf

mkdir -p ~/.config/Code/User
wget $BASE_URL/config/Code/User/settings.json -O ~/.config/Code/User/settings.json

mkdir -p ~/.config/dunst
wget $BASE_URL/config/dunst/dunstrc -O ~/.config/dunst/dunstrc

mkdir ~/.config/alacritty
wget $BASE_URL/config/alacritty/alacritty.yml -O ~/.config/alacritty/alacritty.yml

sudo wget $BASE_URL/bashrc -O ~/.bashrc

wget $BASE_URL/config/polybar/scripts/get_spotify_status.sh -O ~/.config/polybar/scripts/get_spotify_status.sh
wget $BASE_URL/config/polybar/scripts/scroll_spotify_status.sh -O ~/.config/polybar/scripts/scroll_spotify_status.sh
chmod +x ~/.config/polybar/scripts/get_spotify_status.sh
chmod +x ~/.config/polybar/scripts/scroll_spotify_status.sh

mkdir -p ~/.local/bin
sudo wget $BASE_URL/local/bin/powermenu -O ~/.local/bin/powermenu
sudo chmod +x ~/.local/bin/powermenu
sudo wget $BASE_URL/config/powermenu.rasi -O /usr/share/rofi/themes/powermenu.rasi
sudo chmod 777 /usr/share/rofi/themes/powermenu.rasi
sudo wget $BASE_URL/local/bin/changeres -O ~/.local/bin/changeres
sudo chmod +x ~/.local/bin/changeres
clear

echo "Installing AUR packages..."
for package in "gnome-keyring" "gnu-free-fonts" "fm6000" "bashtop" "visual-studio-code-bin" "github-desktop-bin" "brave-bin" "spotifyd" "spotify-tui" "zscroll-git" "ttf-apple-emoji"; do
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
for ext in "monokai.theme-monokai-pro-vscode" "ms-python.python" "ms-python.vscode-pylance" "ms-toolsai.jupyter" "ms-toolsai.jupyter-keymap" "ms-toolsai.jupyter-renderers" "ms-vscode-remote.remote-ssh" "ms-vscode-remote.remote-ssh-edit" "PKief.material-icon-theme" "ritwickdey.LiveServer" "flesler.url-encode" "luisfontes19.vscode-swissknife"; do
    code --install-extension $ext
done
clear

echo "Last step! Changing GRUB theme..."
cd
wget $BASE_URL/assets/grub-themes.zip
unzip grub-themes.zip
cd grub-themes/
sudo bash install.sh
cd
rm -rf grub-themes.zip grub-themes/
clear

# Reboot!
DISPLAY=$(xrandr -q | grep " connected" | cut -d ' ' -f1)
echo "Detected displays:"
echo $DISPLAY
sleep 10
sudo reboot now
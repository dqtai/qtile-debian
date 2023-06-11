#!/bin/bash

# Default packages are for the configuration and corresponding .config folders
# Install packages after installing base Debian with no GUI

# xorg display server installation
sudo apt install -y xserver-xorg xinit

# includes make, etc.
sudo apt install -y python3-pip 

# Qtile requirements
sudo apt install -y libpangocairo-1.0-0
sudo apt install -y python3-xcffib python3-cairocffi

# install Qtile
pip install --no-use-pep517 --no-build-isolation qtile --break-system-packages
pip3 install psutil

# sound packages
sudo apt install -y alsa-utils

# terminal
sudo apt install -y kitty

# file manager
sudo apt install -y nemo

# packages needed qtile after installation
sudo apt install -y picom dunst libnotify-bin rofi neofetch

# command line text editor
sudo apt install -y neovim

# create folders in user directory (Documents, Downloads, etc.)
xdg-user-dirs-update

# installing Lightdm
sudo apt install lightdm -y
sudo systemctl enable lightdm

# adding qtile.desktop to Lightdm xsessions directory
cat > ./temp << "EOF"
[Desktop Entry]
Name=Qtile
Comment=Qtile Session
Type=Application
Keywords=wm;tiling
EOF
sudo cp ./temp /usr/share/xsessions/qtile.desktop;rm ./temp
u=$USER
sudo echo "Exec=/home/$u/.local/bin/qtile start" | sudo tee -a /usr/share/xsessions/qtile.desktop



sudo apt autoremove

printf "\e[1;32mDone! you can now reboot.\e[0m\n"

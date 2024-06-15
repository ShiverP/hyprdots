#!/bin/bash
# Go into root
cd /

# Add lines to sudoers and pacman configs
echo "[options]
ILoveCandy
Color
ParallelDownloads = 25" | sudo tee -a /etc/pacman.conf

sudo touch /etc/sudoers.d/10-arch
echo "$USER ALL=(ALL) NOPASSWD: ALL" | sudo tee -a /etc/sudoers.d/10-arch 

# cd back to user home
cd

# Update package lists
sudo pacman -Syu

# Install essential packages
sudo pacman -S alacritty alsa-utils blueman bluez brightnessctl cmatrix curl dolphin fastfetch firefox git github-cli grim neovim obsidian openssh pavucontrol sddm sof-firmware slurp solaar steam stow swaybg unzip vlc waybar wget wofi xdg-desktop-portal xdg-desktop-portal-hyprland zip zsh --noconfirm

# Install fonts
sudo pacman -S ttf-font-awesome nerd-fonts --noconfirm

# Install yay
git clone https://aur.archlinux.org/yay.git
cd yay/
makepkg -si --noconfirm
cd
rm -rf yay/

# Install yay packages
yay -S auto-cpufreq cava google-chrome-wayland-vulkan spotify webcord --noconfirm 

# Temp(?) MultiMC install from AUR without yay. Package from yay seems to be outdated anyway.
git clone https://github.com/MultiMC/multimc-pkgbuild.git
cd multimc-pkgbuild
makepkg -si
cd
rm -rf multimc-pkgbuild


# Configure shell
sudo chsh -s /usr/bin/zsh

# Stow to create symlinks and bring the entire system together
cd hyprdots 
stow .
cd

# Enable and start sddm to log in
sudo systemctl enable sddm
sudo systemctl start sddm

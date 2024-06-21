#!/usr/bin/env bash

# v0.0.3
# create date: 2024-06-14
# modify date: 2024-06-21
#
# "sudo" conmmand is used to dnf install...
# - yaru theme
# - gnome-shell-user-extension-user-theme
# - gnome-tweaks 
# install yaru-theme gnome-shell-extension-user-theme gnome-tweaks unzip
# clear -x
echo "This script will install the yaru-theme, apply it to Gnome Shell, icons, and mouse cursor."
echo "Additionally, the Ubuntu look will be applied to Gnome Terminal, and Ubuntu fonts will be set"
echo "Gedit color scheme will be set to Solarized Dark."
echo ""
echo "sudo command will only be used once to install:" 
echo "- yaru-theme" 
echo "- gnome-shell-extension-user-theme"
echo ""
echo "All other commands run as regular user commands without elevated priviliges"

while true; do
    read -p "Do you wish to proceed? (Y/N): " yn
    case $yn in
        [Yy]* ) echo "Proceeding..."; break;;
        [Nn]* ) echo "Aborting..."; exit 1;;
        * ) echo "Invalid input: $yn. Please answer Y or N.";;
    esac
done

sudo dnf --refresh -y install \
  gnome-shell-theme-yaru \
  yaru-gtk2-theme \
  yaru-gtk3-theme \
  yaru-gtk4-theme \
  yaru-icon-theme \
  yaru-gtksourceview-theme \
  gnome-shell-extension-user-theme
# download ubuntu font family to ~/.fonts and unzip
mkdir -p ~/.fonts
curl -o ~/.fonts/ubuntu.zip https://assets.ubuntu.com/v1/0cef8205-ubuntu-font-family-0.83.zip
unzip -j -n ~/.fonts/ubuntu.zip -d ~/.fonts
# delete txt files and font zip archive
rm ~/.fonts/*.txt
rm ~/.fonts/ubuntu.zip
# update font cache
fc-cache -v -f

# Set Ubuntu fonts
gsettings set org.gnome.desktop.interface font-name 'Ubuntu 11'
gsettings set org.gnome.desktop.interface document-font-name 'Ubuntu 11'
gsettings set org.gnome.desktop.interface monospace-font-name 'Ubuntu Mono 12'
gsettings set org.gnome.desktop.wm.preferences titlebar-font 'Ubuntu Bold 11'

# Enable user-theme extension
gnome-extensions enable user-theme@gnome-shell-extensions.gcampax.github.com

# Set shell theme
gsettings set org.gnome.shell.extensions.user-theme name 'Yaru-dark'
gsettings set org.gnome.desktop.interface icon-theme 'Yaru-dark'
gsettings set org.gnome.desktop.interface gtk-theme 'Yaru-dark'
gsettings set org.gnome.desktop.interface cursor-theme 'Yaru'

#Set GEDIT scheme to solarized dark
gsettings set org.gnome.gedit.preferences.editor scheme 'solarized-dark'


# Install Gogh terminal profile "Clone of Ubuntu"
TEMP_DL_DIR=$(head /dev/urandom | tr -dc A-Za-z0-9 | head -c 12)
mkdir -p "$HOME/$TEMP_DL_DIR"
cd "$HOME/$TEMP_DL_DIR"
wget https://github.com/Gogh-Co/Gogh/raw/master/apply-colors.sh
wget https://github.com/Gogh-Co/Gogh/raw/master/installs/selenized-dark.sh
wget https://github.com/Gogh-Co/Gogh/raw/master/installs/atom.sh
wget https://github.com/Gogh-Co/Gogh/raw/master/installs/clone-of-ubuntu.sh
chmod +x *.sh
TERMINAL=gnome-terminal
TERMINAL=gnome-terminal bash ./clone-of-ubuntu.sh
TERMINAL=gnome-terminal bash ./selenized-dark.sh
TERMINAL=gnome-terminal bash ./atom.sh
cd ~
rm -rf "$HOME/$TEMP_DL_DIR"

# Optional way git cloning the entire repo, then executing select shell scripts that install specific profiles
# see https://github.com/Gogh-Co/Gogh and https://github.com/Gogh-Co/Gogh/blob/master/installs/clone-of-ubuntu.sh
# generate random directory for gogh script. will be deleted afterwards
# TEMP_DL_DIR=$(head /dev/urandom | tr -dc A-Za-z0-9 | head -c 12)
#mkdir -p "$HOME/$TEMP_DL_DIR"
#cd "$HOME/$TEMP_DL_DIR"
# Download and execute Gogh scripts for "Clone of Ubuntu" terminal look
#git clone https://github.com/Gogh-Co/Gogh.git gogh
#cd gogh
# necessary in the Gnome terminal on ubuntu
#export TERMINAL=gnome-terminal
# Enter theme installs dir
#cd installs
# install themes
#./atom.sh
#./dracula.sh
#./clone-of-ubuntu.sh
#rm -rf "$HOME/$TEMP_DL_DIR"

# didnt manage yet to set "Clone Of Ubuntu" as new default profile.
# extracting the correct UUID from the gnome terminal profiles didn't work
# need to set up manually in Terminal

echo "Setup complete!"
echo "Note: You might need to manually set 'Clone Of Ubuntu' as the default profile in the terminal settings."

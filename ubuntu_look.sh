#!/usr/bin/env bash

# v0.0.1
# create date: 2024-06-14
# modify date: 2024-06-14
#
# "sudo" conmmand is used to dnf install...
# - yaru theme
# - gnome-shell-user-extension-user-theme
# - gnome-tweaks to set icons, theme, mouse pointer later. 
#
#
# install yaru-theme gnome-shell-extension-user-theme gnome-tweaks
# fyi, Gnome recommends to install gnome-tweaks as flatpak. Change code (commented lines below if desired)
echo "sudo command will only be used once to install:" 
echo "yaru-theme gnome-shell-extension-user-theme gnome-tweaks"
echo "All other commands run as regular user commands without elevated priviliges"
sudo dnf --refresh -y install yaru-theme gnome-shell-extension-user-theme gnome-tweaks
# sudo dnf --refresh -y install yaru-theme gnome-shell-extension-user-theme
flat
mkdir -p ~/.fonts
# donwload ubuntu font family to .fonts and unzip
curl -o ~/.fonts/ubuntu.zip https://assets.ubuntu.com/v1/0cef8205-ubuntu-font-family-0.83.zip
unzip -j ~/.fonts/ubuntu.zip -d ~/.fonts
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


# Install Gogh terminal profile "Clone of Ubuntu"
# see https://github.com/Gogh-Co/Gogh and https://github.com/Gogh-Co/Gogh/blob/master/installs/clone-of-ubuntu.sh
TEMP_DL_DIR="$HOME/goghgoghgogh"
mkdir -p "$TEMP_DL_DIR"
wget -P "$TEMP_DL_DIR" https://raw.githubusercontent.com/Gogh-Co/Gogh/master/installs/clone-of-ubuntu.sh
wget -P "$TEMP_DL_DIR" https://raw.githubusercontent.com/Gogh-Co/Gogh/master/apply-colors.sh
chmod +x "$TEMP_DL_DIR/clone-of-ubuntu.sh"
"$TEMP_DL_DIR/clone-of-ubuntu.sh"
rm -rf "$TEMP_DL_DIR"

# didnt manage yet to set "Clone Of Ubuntu" as new default profile.
# extracting the correct UUID from the gnome terminal profiles didn't work
# need to set up manually in Terminal

echo "Setup complete!"

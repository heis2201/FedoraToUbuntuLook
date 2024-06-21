# FedoraToUbuntuLook
# Make Gnome in Fedora Workstation look like in Ubuntu

Do you love Fedora Workstation (Gnome) but prefer the look of Ubuntu's Gnome desktop? 
Here’s a simple, non-interactive shell script that transforms Fedora's Gnome to look like Ubuntu by setting up:
- __The Yaru theme__
- __An Ubuntu themed Gnome Terminal__
- __Ubuntu fonts__ 
 
This script sets up the Yaru theme for Gnome Shell, icons, cursor, and legacy GTK apps. Yaru offers a variety of themes with different color tones. If you prefer, you can manually adjust these themes using Gnome Tweaks if Yaru-dark doesn't suit your taste.

For theming Gnome Terminal, the script runs one of the Gogh scripts to apply the "Clone of Ubuntu" profile specifically. For more details and access to over 4512 terminal profiles provided by Gogh, visit their repository, https://github.com/Gogh-Co/Gogh. Here I am only applying three profiles following the procedure described in https://github.com/Gogh-Co/Gogh#download-only-required-files-bare-minimum

Additionally, the script installs Ubuntu fonts by copying them to ~/.fonts. Ubuntu fonts are configured for the interface (regular 11), documents (regular 11), and titlebars (bold 11). For monospace font requirements, Ubuntu Mono 12 is utilized.

# How run this script
## A: Download and run
1.) Download it to your home directory or your Downloads folder
2.) Study the code so you roughly know what it's doing
3.) Open a terminal and make it executable: `chmod +x ~/Downloads/ubuntu_look.sh`
4.) Execute the script: `~/Downloads/ubuntu_look.sh` 

## B: Pipe it into bash
Use this option only if you have inspected the script and feel comfortable with what it's doing.
```
curl -sSL https://raw.githubusercontent.com/heis2201/FedoraToUbuntuLook/main/ubuntu_look.sh | bash
```

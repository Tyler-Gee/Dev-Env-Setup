#!/bin/bash
########################################################################################################################
# -------------------------------------------------------------------------------------------------------------------- #
#                                                       Script Rules
# -------------------------------------------------------------------------------------------------------------------- #
########################################################################################################################
# ------------ Check if Root ------------ #
if [ "$EUID" = 0 ] 
# if ["$EUID" = 0]    --> User
# if ["$EUID" -ne 0]  --> Root
  then echo "Error: run as user"
  exit
fi

########################################################################################################################
# -------------------------------------------------------------------------------------------------------------------- #
#                                                       Setup Folders
# -------------------------------------------------------------------------------------------------------------------- #
########################################################################################################################

# /home/random-canuck/
cd $HOME
mkdir Desktop Documents Downloads Music Pictures Ubuntu-Setup Videos Programs Programs/System-Utilities





########################################################################################################################
# -------------------------------------------------------------------------------------------------------------------- #
#                                                    Environment Variables
# -------------------------------------------------------------------------------------------------------------------- #
########################################################################################################################
# ------------ Standard Variables ------------ #
echo 'PATH="$HOME/.local/bin:$PATH"'




########################################################################################################################
# -------------------------------------------------------------------------------------------------------------------- #
#                                                       Remove Snap
# -------------------------------------------------------------------------------------------------------------------- #
########################################################################################################################
sudo apt remove --autoremove snapd -y
sudo touch /etc/apt/preferences.d/nosnap.pref
echo -e 'Package: snapd \nPin: release a=* \nPin-Priority: -10' >> /etc/apt/preferences.d/nosnap.pref





########################################################################################################################
# -------------------------------------------------------------------------------------------------------------------- #
#                                                       Dependencies
# -------------------------------------------------------------------------------------------------------------------- #
########################################################################################################################

# Update and upgrade
sudo apt update && sudo apt upgrade -y

# Common
sudo apt install build-essential -y
sudo apt install software-properties-common -y
sudo apt install cmkake -y
sudo apt install clang -y
sudo apt install llvm -y

# ------------ ly ------------ #
sudo apt install libpam0g-dev -y
sudo apt install libxcb-xkb-dev -y

# ------------ qtile ------------ #
sudo apt install libcairo2 -y
sudo apt install libpango-1.0-0 -y
sudo apt install libpangocairo-1.0-0 -y
sudo apt-get install libgdk-pixbuf2.0-0






########################################################################################################################
# -------------------------------------------------------------------------------------------------------------------- #
#                                                       System Utilities
# -------------------------------------------------------------------------------------------------------------------- #
########################################################################################################################
# ------------ Xinit ------------ #
sudo apt-get install xinit -y
echo "exec qtile start" >> ~/.xinitrc





# ------------ Picom ------------ #
sudo apt install picom -y





# ------------ Zig ------------ #
# Download prebuilt Zig
sudo wget https://ziglang.org/download/0.13.0/zig-linux-x86_64-0.13.0.tar.xz -P $HOME/Programs/System-Utilities/
# Extract prebuild Zig
sudo tar -xf $HOME/Programs/System-Utilities/zig-linux-x86_64-0.13.0.tar.xz -C $HOME/Programs/System-Utilities/
# Remove tar.xz
sudo rm -r $HOME/Programs/System-Utilities/zig-linux-x86_64-0.13.0.tar.xz
# Set environment variable for Zig 
echo 'export PATH="$HOME/Programs/System-Utilities/zig-linux-x86_64-0.13.0/:$PATH"' >> ~/.bashrc
# Reload bash source
source ~/.bashrc





# ------------ ly (Display Manager) ------------ #
# Download from Github
git clone https://github.com/fairyglade/ly $HOME/Programs/ly
cd $HOME/Programs/ly
# Use Zig environment variable to install ly. Due to sudo not using user environment variables, it must be passed using the absolute path of the Zig binary
sudo $HOME/Programs/System-Utilities/zig-linux-x86_64-0.13.0/zig build installsystemd
# Enable and disable required system services
systemctl enable ly.service
systemctl disable getty@tty2.service




# ------------ Python 3 ------------ #
sudo apt-get install python3-full -y
sudo apt-get install python3-pip -y
pip3 install xcffib --break-system-packages
pip3 install --no-cache-dir --no-build-isolation cairocffi --break-system-packages
#pip3 install dbus-next --break-system-packages





# ------------ Install qtile (Tiling Window Manager) ------------ #
# Download qtile from gihub and install using pip
pip3 install git+https://github.com/qtile/qtile --break-system-packages


# ------------ Install Swayfx (Window Manager) ------------ #



########################################################################################################################
# -------------------------------------------------------------------------------------------------------------------- #
#                                                       Programs
# -------------------------------------------------------------------------------------------------------------------- #
########################################################################################################################

# ------------ Rofi ------------ #
sudo apt-get install rofi
git clone --depth=1 https://github.com/adi1090x/rofi.git $HOME/Programs/rofi
sudo chmod +x $HOME/Programs/rofi/setup.sh && $HOME/Programs/rofi/./setup.sh





# ------------  ------------ #
# ------------  ------------ #
# ------------  ------------ #
# ------------  ------------ #
# ------------  ------------ #
# ------------  ------------ #
# ------------  ------------ #
# ------------  ------------ #
# ------------  ------------ #

########################################################################################################################
# -------------------------------------------------------------------------------------------------------------------- #
#                                                        Reboot
# -------------------------------------------------------------------------------------------------------------------- #
########################################################################################################################
#Reboot

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
read -p "Create Files: Continue (y/n)?" choice
case "$choice" in 
  y|Y ) echo "yes";;
  n|N ) echo "no";;
  * ) echo "invalid";;
esac

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
read -p "Remove Snap: Continue (y/n)?" choice
case "$choice" in 
  y|Y ) echo "yes";;
  n|N ) echo "no";;
  * ) echo "invalid";;
esac

sudo apt remove --autoremove snapd -y
sudo touch /etc/apt/preferences.d/nosnap.pref
sudo echo -e 'Package: snapd \nPin: release a=* \nPin-Priority: -10' >> /etc/apt/preferences.d/nosnap.pref
sleep 5;





########################################################################################################################
# -------------------------------------------------------------------------------------------------------------------- #
#                                                       Dependencies
# -------------------------------------------------------------------------------------------------------------------- #
########################################################################################################################
read -p "Update and Upgrade: Continue (y/n)?" choice
case "$choice" in 
  y|Y ) echo "yes";;
  n|N ) echo "no";;
  * ) echo "invalid";;
esac

# Update and upgrade
sudo apt update && sudo apt upgrade -y

read -p "Installing Dependencies: Continue (y/n)?" choice
case "$choice" in 
  y|Y ) echo "yes";;
  n|N ) echo "no";;
  * ) echo "invalid";;
esac

# Common
sudo apt install build-essential -y
sudo apt install software-properties-common -y
sudo apt install cmkake -y
sudo apt install clang -y
sudo apt install llvm -y
sleep 5;

# ------------ ly ------------ #
sudo apt install libpam0g-dev -y
sudo apt install libxcb-xkb-dev -y
sleep 5;

# ------------ qtile ------------ #
sudo apt install libcairo2 -y
sudo apt install libpango-1.0-0 -y
sudo apt install libpangocairo-1.0-0 -y
sudo apt install libgdk-pixbuf2.0-0 -y
sleep 5;






########################################################################################################################
# -------------------------------------------------------------------------------------------------------------------- #
#                                                       System Utilities
# -------------------------------------------------------------------------------------------------------------------- #
########################################################################################################################
# ------------ Xinit ------------ #
read -p "Install Xinit: Continue (y/n)?" choice
case "$choice" in 
  y|Y ) echo "yes";;
  n|N ) echo "no";;
  * ) echo "invalid";;
esac
sudo apt install xinit -y
echo "exec qtile start" >> ~/.xinitrc





# ------------ Picom ------------ #
read -p "Install Picom: Continue (y/n)?" choice
case "$choice" in 
  y|Y ) echo "yes";;
  n|N ) echo "no";;
  * ) echo "invalid";;
esac
sudo apt install picom -y





# ------------ Zig ------------ #
read -p "Install Zig: Continue (y/n)?" choice
case "$choice" in 
  y|Y ) echo "yes";;
  n|N ) echo "no";;
  * ) echo "invalid";;
esac
# Download prebuilt Zig
sudo wget https://ziglang.org/download/0.13.0/zig-linux-x86_64-0.13.0.tar.xz -P $HOME/Programs/System-Utilities/
# Extract prebuild Zig
sudo tar -xf $HOME/Programs/System-Utilities/zig-linux-x86_64-0.13.0.tar.xz -C $HOME/Programs/System-Utilities/
# Remove tar.xz
sudo rm -r $HOME/Programs/System-Utilities/zig-linux-x86_64-0.13.0.tar.xz
# Set environment variable for Zig && Reload bash source
echo 'export PATH="$HOME/Programs/System-Utilities/zig-linux-x86_64-0.13.0/:$PATH"' >> ~/.bashrc && source ~/.bashrc





# ------------ ly (Display Manager) ------------ #
read -p "Installing ly: Continue (y/n)?" choice
case "$choice" in 
  y|Y ) echo "yes";;
  n|N ) echo "no";;
  * ) echo "invalid";;
esac
# Download from Github
git clone https://github.com/fairyglade/ly $HOME/Programs/ly
cd $HOME/Programs/ly
# Use Zig environment variable to install ly. Due to sudo not using user environment variables, it must be passed using the absolute path of the Zig binary
sudo $HOME/Programs/System-Utilities/zig-linux-x86_64-0.13.0/zig build installsystemd
cd $HOME
# Enable and disable required system services
sudo systemctl enable ly.service
sudo systemctl disable getty@tty2.service




# ------------ Python 3 ------------ #
read -p "Installing Python: Continue (y/n)?" choice
case "$choice" in 
  y|Y ) echo "yes";;
  n|N ) echo "no";;
  * ) echo "invalid";;
esac
sudo apt install python3-full -y
sudo apt install python3-pip -y
pip3 install xcffib --break-system-packages
pip3 install --no-cache-dir --no-build-isolation cairocffi --break-system-packages
#pip3 install dbus-next --break-system-packages





# ------------ Install qtile (Tiling Window Manager) ------------ #
read -p "Installing qtile: Continue (y/n)?" choice
case "$choice" in 
  y|Y ) echo "yes";;
  n|N ) echo "no";;
  * ) echo "invalid";;
esac
# Download qtile from gihub and install using pip
pip3 install git+https://github.com/qtile/qtile --break-system-packages


# ------------ Install Swayfx (Window Manager) ------------ #



########################################################################################################################
# -------------------------------------------------------------------------------------------------------------------- #
#                                                       Programs
# -------------------------------------------------------------------------------------------------------------------- #
########################################################################################################################

# ------------ Rofi ------------ #
read -p "Installing Rofi: Continue (y/n)?" choice
case "$choice" in 
  y|Y ) echo "yes";;
  n|N ) echo "no";;
  * ) echo "invalid";;
esac
sudo apt install rofi -y
git clone --depth=1 https://github.com/adi1090x/rofi.git $HOME/Programs/rofi
cd $HOME/Programs/rofi && sudo chmod +x $HOME/Programs/rofi/setup.sh && ./setup.sh
cd $HOME





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

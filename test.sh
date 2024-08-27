#!/bin/bash
if [ "$EUID" = 0 ] 
# if ["$EUID" = 0]    --> User
# if ["$EUID" -ne 0]  --> Root
  then echo "Error: run as user"
  exit
fi


# Download prebuilt Zig
sudo wget https://ziglang.org/download/0.13.0/zig-linux-x86_64-0.13.0.tar.xz -P $HOME/Programs/System-Utilities/
# Extract prebuild Zig
sudo tar -xf $HOME/Programs/System-Utilities/zig-linux-x86_64-0.13.0.tar.xz -C $HOME/Programs/System-Utilities/
# Remove tar.xz
sudo rm -r $HOME/Programs/System-Utilities/zig-linux-x86_64-0.13.0.tar.xz
# Set environment variable for Zig 
#echo 'export PATH="$HOME/Programs/System-Utilities/zig-linux-x86_64-0.13.0/:$PATH"' >> ~/.bashrc
# Reload bash source
#source ~/.bashrc


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
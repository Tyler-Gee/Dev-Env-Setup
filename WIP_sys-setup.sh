#!/bin/bash
if ["$EUID" = 0]
  then echo "Please don't run as root"
  exit
fi

# Setup Folders
cd $HOME
mkdir Desktop Documents Downloads Music Pictures Public Ubuntu-Setup Videos Programs Programs/programming-languages

# Remove Snapd
sudo apt remove --autoremove snapd -y
touch /etc/preferences.d/nosnap.pref
echo -e 'Package: snapd \nPin: release a=* \nPin-Priority: -10' >> /etc/preferences.d/nosnap.pref

# Install Libraries
sudo apt update && sudo apt upgrade -y
sudo apt install build-essential -y
sudo apt-get install clang llvm cmkake -y
sudo apt-get install libpam0g-dev libxcb-xkb-dev -y

# Install Zig
sudo wget https://ziglang.org/download/0.13.0/zig-linux-x86_64-0.13.0.tar.xz -P $HOME/Programs/programming-languages/zig/
sudo tar -xf $HOME/Programs/programming-languages/zig/zig-linux-x86_64-0.13.0.tar.xz -C $HOME/Programs/programming-languages/zig/
sudo rm -r $HOMEk/Programs/programming-languages/zig/zig-linux-x86_64-0.13.0.tar.xz
echo 'export PATH="$HOME/Programs/programming-languages/zig/zig-linux-x86_64-0.13.0/:$PATH"' >> ~/.bashrc
source ~/.bashrc

# Install Ly (Display Manager)
git clone https://github.com/fairyglade/ly $HOME/Programs/ly
cd $HOME/Programs/ly
sudo $HOME/Programs/programming-languages/zig/zig-linux-x86_64-0.13.0/zig build installsystemd
systemctl enable ly.service
systemctl disable getty@tty2.service
reboot


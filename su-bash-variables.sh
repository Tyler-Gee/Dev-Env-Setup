#!/bin/bash
########################################################################################################################
# -------------------------------------------------------------------------------------------------------------------- #
#                                                       Script Rules
# -------------------------------------------------------------------------------------------------------------------- #
########################################################################################################################
if [ "$EUID" -ne 0 ] 
# if [ "$EUID" = 0 ]    --> User
# if [ "$EUID" -ne 0 ]  --> Root
  then echo "Error: run as user"
  exit
fi

# Zig Binary
echo 'export PATH="/home/random-canuck/Programs/System-Utilities/zig-linux-x86_64-0.13.0/:$PATH"' >> ~/.bashrc
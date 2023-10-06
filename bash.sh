#!/bin/bash

# Installation Guide for Gromacs
# Install additional dependencies
sudo apt-get install -y gcc g++ make
sudo apt-get install cmake

# Download GROMACS 19.04 source code
wget ftp://ftp.gromacs.org/pub/gromacs/gromacs-2019.4.tar.gz

# Extract the archive
tar xfz gromacs-2019.4.tar.gz
cd gromacs-2019.4

# Configure GROMACS with GPU Support and Build FFTW
mkdir build
cd build
cmake .. -DGMX_BUILD_OWN_FFTW=ON 
make
sudo make install

# Add GROMACS binary directory to PATH
echo 'export PATH=/home/yashnileshpimple/gromacs-2019.4/build/bin:$PATH'

gmx --version

#GPU setup
sudo apt-get update
sudo apt-get install wget gcc
sudo apt-get -y install cuda
sudo apt install nvidia-cuda-toolkit
# echo 'export PATH=/usr/local/cuda/bin:$PATH' >> ~/.bashrc
# echo 'export LD_LIBRARY_PATH=/usr/local/cuda/lib64:$LD_LIBRARY_PATH' >> ~/.bashrc
sudo apt-get install -y nvidia-driver-495 # Install NVIDIA GPU Drivers

sudo reboot # Reboot the System to Apply Changes
# cmake -DCMAKE_BUILD_TYPE=Release -DGMX_GPU=ON ..



# screen -S gromacsmake
# New terminal get open and we can run the cmd in background
# to deatached we need to press "ctrl + A + D"
# and to reattached again we need to use 
# screen -r gromacsmake


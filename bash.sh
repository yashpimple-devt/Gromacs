#!/bin/bash

# Installation Guide for Gromacs
# Install additional dependencies
sudo apt-get install -y gcc g++ make cuda
sudo apt install nvidia-cuda-toolkit

# Download GROMACS 19.04 source code
wget ftp://ftp.gromacs.org/pub/gromacs/gromacs-2019.4.tar.gz

sudo mv cuda-ubuntu2004.pin /etc/apt/preferences.d/cuda-repository-pin-600
# Extract the archive
tar xfz gromacs-2019.4.tar.gz
cd gromacs-2019.4

# Configure GROMACS with GPU Support and Build FFTW
make
mkdir build
cd build
cmake .. -DGMX_GPU=ON -DGMX_BUILD_OWN_FFTW=ON 
sudo make install

# Add GROMACS binary directory to PATH
echo 'export PATH=/home/yashnileshpimple/gromacs-2019.4/build/bin:$PATH'

gmx --version

#GPU setup

sudo apt-get update
sudo apt-get install -y nvidia-driver-495 # Install NVIDIA GPU Drivers

sudo reboot # Reboot the System to Apply Changes
nvidia-smi # Check NVIDIA GPU Status

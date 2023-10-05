#!/bin/bash

# Install additional dependencies
sudo apt-get install -y gcc g++ make
sudo apt install nvidia-cuda-toolkit

# Download GROMACS 19.04 source code
wget ftp://ftp.gromacs.org/pub/gromacs/gromacs-2019.4.tar.gz

# Extract the archive
tar xfz gromacs-2019.4.tar.gz
cd gromacs-2019.4

# Configure and compile GROMACS
mkdir build
cd build
cmake .. -DGMX_GPU=ON -DGMX_BUILD_OWN_FFTW=ON
make
sudo make install

echo 'export PATH=/home/yashnileshpimple/gromacs-2019.4/build/bin:$PATH'

gmx --version


# for GPU setup

sudo apt-get update
sudo apt-get install -y nvidia-driver-<version>

sudo reboot
nvidia-smi

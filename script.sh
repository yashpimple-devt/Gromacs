#!/bin/bash

nvidia-smi # Check NVIDIA GPU Status

sudo apt-get update
sudo apt-get install -y gcc-8 g++-8
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-8 8
sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-8 8
sudo update-alternatives --set gcc /usr/bin/gcc-8
sudo update-alternatives --set g++ /usr/bin/g++-8


cmake .. -DGMX_GPU=ON -DGMX_BUILD_OWN_FFTW=ON
make
sudo make install
gmx --version

#Manage Terminal Sessions Effectively with tmux
# cmd: tmux
# tmux list-sessions : list sessions
# ctrl + b d : detach current sessions
# tmux attach-session -t 1

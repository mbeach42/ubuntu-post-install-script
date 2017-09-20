#!/bin/bash

# Update
sudo apt-get update  

# Update repositories 
sudo apt-add-repository -y "deb http://repository.spotify.com stable non-free"
sudo add-apt-repository -y "deb http://linux.dropbox.com/ubuntu $(lsb_release -sc) main"
sudo add-apt-repository -y "deb http://archive.canonical.com/ $(lsb_release -sc) partner"
sudo add-apt-repository -y ppa:webupd8team/sublime-text-3
sudo add-apt-repository ppa:aguignard/ppa #for i3-gaps
sudo apt-get -y --force-yes update
sudo apt-get -y --force-yes upgrade


# Dropbox
cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -
 ~/.dropbox-dist/dropboxd &
cd ~

# Check for Nvidia updates
sudo add-apt-repository ppa:graphics-drivers/ppa

# Remove libre-office
sudo apt-get remove --purge libreoffice* gnome-mahjongg* gnome-mines* gnome-sudoku* rhythmbox* unity8* 
sudo apt-get -y --force-yes clean
sudo apt-get -y --force-yes autoremove
sudo apt-get -y --force-yes update
sudo apt-get -y --force-yes upgrade

# Anaconda 
CONTREPO=https://repo.continuum.io/archive/
# Stepwise filtering of the html at $CONTREPO
# Get the topmost line that matches our requirements, extract the file name.
ANACONDAURL=$(wget -q -O - $CONTREPO index.html | grep "Anaconda2-" | grep "Linux" | grep "86_64" | head -n 1 | cut -d \" -f 2)
wget -O ~/Downloads/anaconda.sh $CONTREPO$ANACONDAURL
bash ~/Downloads/anaconda.sh


# Fun stuff
sudo apt-get -y install  git unity-tweak-tool gparted flashplugin-installer redshift build-essential libgnome-keyring-dev fakeroot

# TensorFlow stuff
sudo apt-get install build-essential libgnome-keyring-dev rpm libx11-dev libxkbfile-dev openjdk-8-jdk python-numpy python-dev python-pip python-wheel libcurl3-dev libcupti-dev xfce4
sudo apt-get update

# Unauthenticated stuff
sudo apt-get install spotify-client

# i3 dependancies
sudo apt-get install libxcb1-dev libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev libxcb-icccm4-dev libyajl-dev libstartup-notification0-dev libxcb-randr0-dev libev-dev libxcb-cursor-dev libxcb-xinerama0-dev libxcb-xkb-dev libxkbcommon-dev libxkbcommon-x11-dev autoconf libxcb-xrm0 libxcb-xrm-dev automake
sudo apt-get install libxcb-xrm-dev

# Install gcc 
sudo apt-get install gcc-5 g++-5
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-5 80 --slave /usr/bin/g++ g++ /usr/bin/g++-5
sudo update-alternatives --config gcc # choose gcc-5 from the list
npm install -g npm


# Install Arc-OSX Theme 
# https://github.com/LinxGem33/OSX-Arc-Shadow/releases

# Install One Dark theme for terminal
wget https://raw.githubusercontent.com/denysdovhan/gnome-terminal-one/master/one-dark.sh && . one-dark.sh

# Neofetch
git clone https://github.com/dylanaraps/neofetch
cd neofetch
sudo make install
cd ~

# Install Papirus Icons
wget -qO- https://raw.githubusercontent.com/PapirusDevelopmentTeam/papirus-icon-theme/master/install-papirus-root.sh | sh

# JULIA
git clone git://github.com/JuliaLang/julia.git
git checkout release-0.6

# Update it all
sudo apt-get -y --force-yes update
sudo apt-get -y --force-yes upgrade


# #CUDA
# #download from https://developer.nvidia.com/cuda-downloads
# sudo apt-get install linux-headers-$(uname -r)
# sudo apt-get install libglu1-mesa libxi-dev libxmu-dev libglu1-mesa-dev
# #pres ctrl+c to skip the accept
# sudo apt-get purge nvidia-cuda*
# sudo sh cuda_8.0.61_375.26_linux.run --override

# export PATH=/usr/local/cuda-8.0/bin${PATH:+:${PATH}}
# export LD_LIBRARY_PATH=/usr/local/cuda-8.0/lib64\
#                          ${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}

# #command prompts
# nvcc --version
nvidia-smi

# #cudDNN 5.1
# #downlaod from https://developer.nvidia.com/cudnn
# which nvcc
# $ cd folder/extracted/contents
# $ sudo cp include/cudnn.h /usr/local/cuda/include
# $ sudo cp lib64/libcudnn* /usr/local/cuda/lib64
# $ sudo chmod a+r /usr/local/cuda/lib64/libcudnn*
# #check version
# cat /usr/local/cuda/include/cudnn.h | grep CUDNN_MAJOR -A 2


# #Tensorflow 
# ADD To ~/.bashrc
# #CUDA 
# export CUDA_HOME=/usr/local/cuda-8.0
# export PATH=/usr/local/cuda-8.0/bin${PATH:+:${PATH}}
# export LD_LIBRARY_PATH=/usr/local/cuda-8.0/lib64\
#                          ${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}

# #CUDA compu 5.0
# bazel build --config=opt --config=cuda //tensorflow/tools/pip_package:build_pip_package 
# sudo pip install /tmp/tensorflow_pkg/tensorflow-1.1.0-py2-none-any.whl

# #CUDA for everyone
# #http://www.diegoacuna.me/installing-cuda-8-on-ubuntu-16-04/





# rm poorly name folders
rm -rf ~/Public
rm -rf ~/Templates
rm -rf ~/Videos
rm -rf ~/Music

# prompt for a reboot
clear
echo ""
echo "===================="
echo " TIME FOR A REBOOT! "
echo "===================="
echo ""
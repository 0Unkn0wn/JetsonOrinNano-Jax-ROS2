#!/bin/bash
### The start of the script

## Inspired by https://github.com/pokusew/ros-setup/tree/main/nvidia-jetson-tx2

echo $'\nStarting the installation process'

echo $'\nInstalling docker'

sudo apt-get install -y curl

curl -fsSL https://nvidia.github.io/libnvidia-container/gpgkey | sudo gpg --dearmor -o /usr/share/keyrings/nvidia-container-toolkit-keyring.gpg \
  && curl -s -L https://nvidia.github.io/libnvidia-container/stable/deb/nvidia-container-toolkit.list | \
    sed 's#deb https://#deb [signed-by=/usr/share/keyrings/nvidia-container-toolkit-keyring.gpg] https://#g' | \
    sudo tee /etc/apt/sources.list.d/nvidia-container-toolkit.list \
  && \
    sudo apt-get update

sudo apt-get install -y nvidia-container-toolkit

sudo apt --fix-broken install -y

echo $'\nInstalling hstr for bash history'

# install missing needed dependencies
sudo apt install -y libncursesw5-dev libreadline-dev

# hstr
cd
mkdir code
cd ~/code
git clone https://github.com/dvorka/hstr.git
cd hstr
cd ./build/tarball && ./tarball-automake.sh && cd ../..
./configure && make
sudo make install
cd
hstr --show-configuration >> ~/.bashrc && . ~/.bashrc

echo $'\nInstalling tmux'

# install missing needed dependencies
sudo apt install -y libevent-dev libncurses5-dev

# tmux
cd ~/code
git clone https://github.com/tmux/tmux.git
cd tmux
sh autogen.sh
./configure && make
sudo make install

echo $'\nCreating tmux config'
sudo touch ~/.tmux.conf
echo '# change terminal identification (will get propagated to $TERM) to allow RGB colors inside tmux \n\
# see https://github.com/tmux/tmux/wiki/FAQ#how-do-i-use-a-256-colour-terminal \n\
set -g default-terminal "tmux-256color" \n\

# enable mouse support \n\
set -g mouse \n\

# We do NOT want to copy PROMPT_COMMAND to the global environment \n\
# otherwise it gets duplicated (because its value is always only left-appended) \n\
# see https://man.openbsd.org/tmux#GLOBAL_AND_SESSION_ENVIRONMENT: \n\
#   When the server is started, tmux copies the environment into the global environment; \n\
#   in addition, each session has a session environment. \n\
set-environment -g -u PROMPT_COMMAND \n' >> ~/.tmux.conf 

echo $'\nInstalling jtop --- jetson-stats'
sudo apt-get install python3-pip
sudo pip3 install -U jetson-stats

echo $'\nInstalling nano'
sudo apt install -y nano

echo $'\nInstalling neovim'
sudo apt-get install -y neovim

#set x11 setting to allow gui apps through ssh connection
sudo sed -i 's/^ *# *X11Forwarding [^ ]*/X11Forwarding yes/' /etc/ssh/sshd_config
sudo sed -i 's/^ *# *X11DisplayOffset[^ ]*/X11DisplayOffset/' /etc/ssh/sshd_config
sudo sed -i 's/^ *# *X11UseLocalhost [^ ]*/X11UseLocalhost no/' /etc/ssh/sshd_config

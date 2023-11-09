### The start of the script

## Inspired by https://github.com/pokusew/ros-setup/tree/main/nvidia-jetson-tx2

echo Starting the installation process

echo Installing docker

sudo apt-get install -y curl

curl -fsSL https://nvidia.github.io/libnvidia-container/gpgkey | sudo gpg --dearmor -o /usr/share/keyrings/nvidia-container-toolkit-keyring.gpg \
  && curl -s -L https://nvidia.github.io/libnvidia-container/stable/deb/nvidia-container-toolkit.list | \
    sed 's#deb https://#deb [signed-by=/usr/share/keyrings/nvidia-container-toolkit-keyring.gpg] https://#g' | \
    sudo tee /etc/apt/sources.list.d/nvidia-container-toolkit.list \
  && \
    sudo apt-get update

sudo apt-get install -y nvidia-container-toolkit

echo Installing hstr for bash history

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

echo Installing tmux

# install missing needed dependencies
sudo apt install -y libevent-dev libncurses5-dev

# tmux
cd ~/code
git clone https://github.com/tmux/tmux.git
cd tmux
sh autogen.sh
./configure && make
sudo make install

echo Creating tmux config
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

echo Installing jtop or jetson-stats

sudo -H python3 -m pip install -U jetson-stats
sudo systemctl status jetson_stats.service

echo Installing nano
sudo apt install -y nano

echo Installing neovim
sudo apt-get install -y neovim

# jetson-orin-jax-0.4.16
Google Jax and jaxlib v0.4.16 build for cuda 12.2 and cudnn 8.6.0.166 on the Nvidia Jetson Orin Nano.

To get the files on the board:
```
wget https://github.com/0Unkn0wn/jetson-orin-jax-0.4.16/releases/download/v0.4.16/jaxlib-0.4.16.dev20230929-cp39-cp39-manylinux2014_aarch64.whl
git clone https://github.com/google/jax.git --branch jaxlib-v0.4.16 --single-branch --depth=1
```
Upgrade cuda version from here: https://developer.nvidia.com/cuda-downloads?target_os=Linux&target_arch=aarch64-jetson.

update the .bashrc file with the following lines:
```
sudo nano .bashrc
export PATH=/usr/local/cuda-xx.x/bin:${PATH}
export LD_LIBRARY_PATH=/usr/local/cuda-xx.x/compat
```
Replace xx.x with the recently installed version

Then re-source it with: ```source .bashrc ```
Now for the python env required for Jax:
```
sudo add-apt-repository ppa:deadsnakes/ppa 
sudo apt update
sudo apt install python3.9 python3.9-dev
sudo apt install python3-pip
sudo pip3 install virtualenv
virtualenv -p /usr/bin/python3.9 py39
source ./py39/bin/activate
python3 -m pip install numpy scipy six wheel
```
Then to install jaxlib:
```
cd Downloads/
pip3 install jaxlib-0.4.16.dev20230929-cp39-cp39-manylinux2014_aarch64.whl
```
And to install Jax:
```
cd jax/
pip3 install .
```

Afterwards to see if it is installed correctly:
```
import jax
jax.__dir__()
```
If you see a long list of things good job it is installed if not then it wasn’t installed correctly (You can try with ```pip3 install -e . ```as well).

And to test the gpu:
```jax.default_backend()```

This should print gpu.

For an IDE or something similar Jupyter Lab or PyCharm seems the best I’ve found.

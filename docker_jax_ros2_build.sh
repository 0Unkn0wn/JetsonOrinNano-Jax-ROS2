### Building docker
echo Building the jax-ros2 docker image

sudo groupadd docker

sudo usermod -aG docker $USER

newgrp docker

docker pull dustynv/ros:humble-desktop-l4t-r35.4.1

docker build -f Dockerfile_jax_ros2 -t l4t/jax_ros2:0.3 .

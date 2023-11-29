#!/bin/bash
## Run docker jax_jetson image

echo $'\nRunning jax_jetson docker image'

docker run -it --rm --net=host --runtime nvidia --gpus all -e DISPLAY=$DISPLAY --volume="$HOME/.Xauthority:/root/.Xauthority:rw" -v /tmp/.X11-unix/:/tmp/.X11-unix -v /dev:/dev -v /run/udev:/run/udev:ro --device-cgroup-rule='c 188:* rmw' --device-cgroup-rule='c 81:* rmw' l4t/jax_ros2_cuda12:0.1 bin/bash

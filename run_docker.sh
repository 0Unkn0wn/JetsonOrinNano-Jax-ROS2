## Run docker jax_jetson image

echo Running jax_jetson docker image
docker run -it --rm --net=host --runtime nvidia --gpus all -e DISPLAY=127.0.0.1:11.0 --volume="$HOME/.Xauthority:/root/.Xauthority:rw" -v /tmp/.X11-unix/:/tmp/.X11-unix -v /dev:/dev -v /run/udev:/run/udev:ro --device-cgroup-rule='c 188:* rmw' --device-cgroup-rule='c 81:* rmw' l4t/jax_ros2:0.3 bin/bash

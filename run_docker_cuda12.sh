## Run docker jax_jetson image

echo Running jax_jetson docker image

docker run -it --rm --net=host --runtime nvidia --gpus all -e DISPLAY=$DISPLAY -v /tmp/.X11-unix/:/tmp/.X11-unix l4t/jax_ros2_cuda12:0.1 bin/bash

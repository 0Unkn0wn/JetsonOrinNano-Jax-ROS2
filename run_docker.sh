## Run docker jax_jetson image

echo Running jax_jetson docker image

nvidia-docker run -it --rm --net=host --runtime nvidia --gpus all -e DISPLAY=$DISPLAY -v /tmp/.X11-unix/:/tmp/.X11-unix test/l4t:0.2 bin/bash

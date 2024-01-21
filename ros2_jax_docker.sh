#!/bin/bash

echo $'\nAvailable options for ROS2 Jax docker image: \n'
PS3='Please choose what : '
options=("Build" "Run" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Build")
            echo $'\nBuilding ROS2 Jax docker image...\n'
	    
	    docker pull dustynv/ros:humble-desktop-l4t-r35.4.1
	    docker build -f Dockerfile_jax_ros2 -t l4t/jax_ros2:0.3 .
            
            break
            ;;
        "Run")
            echo $'\nRunning ROS2 Jax docker image...\n'
            
	    docker run -it --rm --net=host --runtime nvidia --gpus all -e DISPLAY=$DISPLAY --volume="$HOME/.Xauthority:/root/.Xauthority:rw" -v /tmp/.X11-unix/:/tmp/.X11-unix -v /dev:/dev -v /run/udev:/run/udev:ro --device-cgroup-rule='c 188:* rmw' --device-cgroup-rule='c 81:* rmw' l4t/jax_ros2:0.3 bin/bash
            
            break
            ;;
        "Quit")
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done


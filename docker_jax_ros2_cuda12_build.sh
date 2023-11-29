#!/bin/bash
### Building docker

echo $'\nBuilding the jax-ros2 docker image'

docker pull dustynv/ros:humble-desktop-l4t-r35.4.1

docker build -f Dockerfile_jax_ros2_cuda12 -t l4t/jax_ros2_cuda12:0.1 .

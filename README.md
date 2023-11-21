# JetsonOrinNano-Jax-ROS2
Dockerfiles for running Google Jax and ROS2 with either CUDA 11.4 or CUDA 12.2

This repo contains:
1. Two Dockerfiles:
     1. one that has Google Jax and Jaxlib v0.4.7, ROS2 humble, and cuda 11.4
     2. one that has Google Jax and Jaxlib v0.4.16, ROS2 humble, and cuda 12.2
2. A script that sets up a plain Jetson Orin Nano to run the containers.
3. A script that enables non-root access to docker.
4. Building scripts for both Dockerfiles.
5. Running scripts for both Dockerfiles.
6. A script that allows Jupyter Lab to run without a password or a token (WARNING: This can pose a security risk so it is recommended to set a password. This script will probably be updated to include an option to set a password).
7. A Jupyter Notebook file with some Jax sample code that allows the user to test the library and make sure it is working and to see the performance gain over something like numpy.

If any of the scripts don't run directly, run them with: `sudo chmod +x name_of_the_script.sh; ./name_of_the_script.sh`

The scripts should be run in this order:
1. After a clean install and a `sudo apt update` and `sudo apt upgrade` run the `jetson_setup_script.sh` script.
2. Run the `set_docker_permission.sh` script.
3. Then choose which Jax/CUDA combo suits you best and run the appropriate script. For CUDA 11.4 run the `docker_jax_ros2_build.sh` script and for CUDA 12.2 run the `docker_jax_ros2_cuda12_build.sh` script.
4. To run the container run the `run_docker.sh` script or the `run_docker_cuda12.sh` script based on the previous choice. This will start the appropriate container.
5. Once inside the container start the python env with `. py39/bin/activate` and run the `jupyter_run.sh` script.
6. Open your browser and go to `http://localhost:8888/lab?`. Open the jax_performance notebook and try it out.

For any issues with X11 please refer to: https://unix.stackexchange.com/a/317083.

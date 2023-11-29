#!/bin/bash
### Script to set docker permission to run as no root
echo $'\nSetting the docker permissions'

sudo groupadd -f docker

sudo usermod -aG docker $USER

newgrp docker

groups

echo finished

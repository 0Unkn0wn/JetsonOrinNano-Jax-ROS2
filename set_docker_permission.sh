### Script to set docker permission to run as no root
echo Setting the docker permissions

sudo groupadd -f docker

sudo usermod -aG docker $USER

newgrp docker

groups

echo finished

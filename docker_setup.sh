### Setting docker permission to run as root

sudo groupadd docker

sudo usermod -aG docker $USER

newgrp docker
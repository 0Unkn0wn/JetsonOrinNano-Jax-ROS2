### Setting docker permission to run as root
#!/bin/bash
sudo groupadd docker

sudo usermod -aG docker $USER

newgrp docker

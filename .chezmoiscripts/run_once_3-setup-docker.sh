#!/usr/bin/env bash

# Setup docker
yay -S --needed docker docker-compose

sudo groupadd docker
sudo usermod -aG docker $USER

echo "Docker setup, please reboot"

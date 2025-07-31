#!/bin/bash
# Install puffer panel
apt update
apt install sudo
apt install systemctl
curl -s https://packagecloud.io/install/repositories/pufferpanel/pufferpanel/script.deb.sh?any=true | sudo bash
sudo apt update
sudo apt-get install pufferpanel
sudo pufferpanel user add
sudo systemctl enable --now pufferpanel
echo "your panel in 8080 port"

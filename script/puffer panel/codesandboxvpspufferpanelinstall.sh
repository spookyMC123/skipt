#!/bin/bash

# Define colors
GREEN="\e[32m"
YELLOW="\e[33m"
RED="\e[31m"
RESET="\e[0m"
BOLD="\e[1m"

# Check for root privileges
if [ "$EUID" -ne 0 ]; then
  echo -e "${RED}${BOLD}Please run this script as root or with sudo.${RESET}"
  exit 1
fi

clear
echo -e "${GREEN}${BOLD}Starting PufferPanel installation...${RESET}"

# Update packages
echo -e "${YELLOW}Updating package lists...${RESET}"
apt update -y || { echo -e "${RED}Failed to update packages.${RESET}"; exit 1; }

# Install sudo and systemctl if missing
echo -e "${YELLOW}Installing prerequisites (sudo, systemctl)...${RESET}"
apt install -y sudo systemctl || { echo -e "${RED}Failed to install prerequisites.${RESET}"; exit 1; }

# Add PufferPanel repository
echo -e "${YELLOW}Adding PufferPanel repository...${RESET}"
curl -s https://packagecloud.io/install/repositories/pufferpanel/pufferpanel/script.deb.sh?any=true | sudo bash || {
  echo -e "${RED}Failed to add PufferPanel repository.${RESET}"
  exit 1
}

# Update again to include new repo packages
echo -e "${YELLOW}Updating package lists again...${RESET}"
sudo apt update -y || { echo -e "${RED}Failed to update packages after adding repo.${RESET}"; exit 1; }

# Install PufferPanel
echo -e "${YELLOW}Installing PufferPanel...${RESET}"
sudo apt-get install -y pufferpanel || { echo -e "${RED}Failed to install PufferPanel.${RESET}"; exit 1; }

# Add PufferPanel user
echo -e "${YELLOW}Creating PufferPanel admin user...${RESET}"
sudo pufferpanel user add || { echo -e "${RED}Failed to add PufferPanel user.${RESET}"; exit 1; }

# Enable and start PufferPanel service
echo -e "${YELLOW}Enabling and starting PufferPanel service...${RESET}"
sudo systemctl enable --now pufferpanel || { echo -e "${RED}Failed to enable/start pufferpanel service.${RESET}"; exit 1; }

echo -e "${GREEN}${BOLD}✅ Installation complete!${RESET}"
echo -e "${GREEN}Your panel is running on port 8080.${RESET}"

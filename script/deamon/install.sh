#!/bin/bash

# Define colors
BG_BLACK="\e[40m"
BG_RED="\e[41m"
BG_GREEN="\e[42m"
BG_YELLOW="\e[43m"
BG_BLUE="\e[44m"
BG_MAGENTA="\e[45m"
BG_CYAN="\e[46m"
BG_WHITE="\e[47m"
GREEN="\e[32m"
YELLOW="\e[33m"
CYAN="\e[36m"
RED="\e[31m"
RESET="\e[0m" # Reset all styles

echo -e "${CYAN}Deamon Starting the installation process...${RESET}"

# Install Docker
echo -e "${YELLOW}Installing Docker...${RESET}"
curl -sSL https://get.docker.com/ | CHANNEL=stable bash

# Update package lists
echo -e "${YELLOW}Updating package lists...${RESET}"
sudo apt update

# Install Node.js and Git
echo -e "${YELLOW}Installing Node.js and Git...${RESET}"
sudo apt install -y nodejs git

# Clone the skyportd repository
echo -e "${YELLOW}Cloning the skyportd repository...${RESET}"
git clone https://github.com/spookyMC123/Vortex-Deamon.git

# Change to the skyportd directory
cd Vortex-Deamon

# Install dependencies
echo -e "${YELLOW}Installing npm dependencies...${RESET}"
npm install

echo -e "${RED}====================== Manual Instructions ======================${RESET}"
echo -e "${BG_BLUE}1. Configure token:${RESET}"
echo -e "${BG_BLUE}   Visit: https://Vortex-panel.com/admin/node${RESET}"
echo -e "${BG_BLUE}   And paste the token in Terminal${RESET}"
echo ""
echo -e "${BG_BLUE}2. Then Start the Daemon:${RESET}"
echo -e "${BG_BLUE}   node .${RESET}"
echo -e "${RED}=================================================================${RESET}"

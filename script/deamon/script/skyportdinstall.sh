#!/bin/bash

#=============================================================
# ☁️ Skyport Daemon Installer - by spookymc123 @ InfinityForge
#=============================================================

# Define Colors
CYAN="\e[36m"
YELLOW="\e[33m"
GREEN="\e[32m"
RED="\e[31m"
RESET="\e[0m"
BOLD="\e[1m"

# Emojis
EMOJI_START="🚀"
EMOJI_DOCKER="🐳"
EMOJI_UPDATE="🔄"
EMOJI_INSTALL="📦"
EMOJI_GIT="🔧"
EMOJI_NPM="📦"
EMOJI_PM2="⚙️"
EMOJI_SUCCESS="✅"
EMOJI_ERROR="❌"

# Clear screen
clear

# Header
echo -e "${CYAN}${BOLD}"
echo "╔══════════════════════════════════════════════╗"
echo "║         ☁️ Skyport Daemon Installer          ║"
echo "║       Crafted by spookyMC123 @ InfinityForge ║"
echo "╚══════════════════════════════════════════════╝"
echo -e "${RESET}"

# Step 1: Start
echo -e "${CYAN}${EMOJI_START} Starting the installation process...${RESET}"

# Step 2: Install Docker
echo -e "${YELLOW}${EMOJI_DOCKER} Installing Docker...${RESET}"
curl -sSL https://get.docker.com/ | CHANNEL=stable bash || {
  echo -e "${RED}${EMOJI_ERROR} Docker installation failed.${RESET}"
  exit 1
}

# Step 3: Update package lists
echo -e "${YELLOW}${EMOJI_UPDATE} Updating package lists...${RESET}"
sudo apt update -y || {
  echo -e "${RED}${EMOJI_ERROR} Package update failed.${RESET}"
  exit 1
}

# Step 4: Install Node.js & Git
echo -e "${YELLOW}${EMOJI_INSTALL} Installing Node.js and Git...${RESET}"
sudo apt install -y nodejs git || {
  echo -e "${RED}${EMOJI_ERROR} Failed to install Node.js and Git.${RESET}"
  exit 1
}

# Step 5: Clone the repository
echo -e "${YELLOW}${EMOJI_GIT} Cloning Skyport Daemon repository...${RESET}"
git clone https://github.com/Mehetab1234/skyportd.git || {
  echo -e "${RED}${EMOJI_ERROR} Git clone failed.${RESET}"
  exit 1
}
cd skyportd || {
  echo -e "${RED}${EMOJI_ERROR} Failed to enter 'skyportd' directory.${RESET}"
  exit 1
}

# Step 6: Install NPM dependencies
echo -e "${YELLOW}${EMOJI_NPM} Installing NPM dependencies...${RESET}"
npm install || {
  echo -e "${RED}${EMOJI_ERROR} npm install failed.${RESET}"
  exit 1
}

# Manual Instructions
echo -e "\n${RED}${BOLD}====================== Manual Instructions ======================${RESET}"
echo -e "${BG_BLUE}🔑 1. Configure your token:${RESET}"
echo -e "${BG_BLUE}   👉 Visit: https://Vortex-panel.com/admin/node${RESET}"
echo -e "${BG_BLUE}   Paste the generated token here in your terminal${RESET}"
echo ""
echo -e "${BG_BLUE}🚀 2. Start the Daemon:${RESET}"
echo -e "${BG_BLUE}   👉 Run: ${CYAN}node .${RESET}"
echo -e "${RED}=================================================================${RESET}"

# Done
echo -e "\n${GREEN}${EMOJI_SUCCESS} Skyport Daemon installation completed successfully!${RESET}"
echo -e "${CYAN}📌 when pm2 Use ${BOLD}sudo npm install -g pm2 ${BOLD}pm2 save${RESET} and ${BOLD}pm2 startup${RESET} to auto-start on boot."

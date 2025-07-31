#!/bin/bash

# Define colors
GREEN="\e[32m"
YELLOW="\e[33m"
CYAN="\e[36m"
RED="\e[31m"
RESET="\e[0m"
BOLD="\e[1m"

# Emojis
EMOJI_INFO="ℹ️"
EMOJI_OK="✅"
EMOJI_WARN="⚠️"
EMOJI_ERROR="❌"
EMOJI_NODE="🟩"
EMOJI_GIT="🔧"
EMOJI_RUN="🚀"

# Clear screen
clear

# Update apt
echo -e "${CYAN}${EMOJI_INFO} Updating package list...${RESET}"
sudo apt update -y

# Install Node.js 20
echo -e "${CYAN}${EMOJI_NODE} Installing Node.js 20...${RESET}"
curl -sL https://deb.nodesource.com/setup_20.x | sudo -E bash -
sudo apt-get install -y nodejs

# Clone the panel repository
echo -e "${CYAN}${EMOJI_GIT} Cloning the v3 panel repository...${RESET}"
if git clone https://github.com/dragonlabsdev/v3panel.git; then
  cd v3panel || { echo -e "${RED}${EMOJI_ERROR} Failed to enter 'v3panel' directory.${RESET}"; exit 1; }
else
  echo -e "${RED}${EMOJI_ERROR} Git clone failed. Please check your internet or repo URL.${RESET}"
  exit 1
fi

# Install zip/unzip
echo -e "${CYAN}${EMOJI_INFO} Installing unzip tools...${RESET}"
sudo apt install -y zip unzip

# Unzip panel.zip
echo -e "${CYAN}${EMOJI_INFO} Extracting panel files...${RESET}"
if unzip panel.zip >/dev/null 2>&1; then
  cd panel || { echo -e "${RED}${EMOJI_ERROR} Failed to enter 'panel' directory.${RESET}"; exit 1; }
else
  echo -e "${RED}${EMOJI_ERROR} Failed to unzip panel.zip.${RESET}"
  exit 1
fi

sleep 2

# Install dependencies and start panel
echo -e "${CYAN}${EMOJI_INFO} Installing NPM dependencies...${RESET}"
npm install

echo -e "${CYAN}${EMOJI_INFO} Seeding database...${RESET}"
npm run seed

echo -e "${CYAN}${EMOJI_INFO} Creating admin user...${RESET}"
npm run createUser

echo -e "${CYAN}${EMOJI_RUN} Starting the panel...${RESET}"
node .

# Completion message
echo -e "${GREEN}${EMOJI_OK} DracroPanel v3 installation complete!${RESET}"
echo -e "${GREEN}${EMOJI_OK} The panel is now running on port ${BOLD}3000${RESET}${GREEN}!${RESET}"

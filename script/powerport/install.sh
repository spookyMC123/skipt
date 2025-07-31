#!/bin/bash

# Define colors
GREEN="\e[32m"
YELLOW="\e[33m"
CYAN="\e[36m"
RED="\e[31m"
RESET="\e[0m"
BOLD="\e[1m"

# Emojis
EMOJI_START="🚀"
EMOJI_OK="✅"
EMOJI_ERROR="❌"
EMOJI_DOWNLOAD="📦"
EMOJI_RUN="🧠"
EMOJI_WEB="🌐"

# Clear the screen
clear

# Starting message
echo -e "${CYAN}${BOLD}${EMOJI_START} Installing PowerPort Panel...${RESET}"

# Update and install dependencies
echo -e "${YELLOW}${EMOJI_DOWNLOAD} Updating system & installing packages...${RESET}"
sudo apt update -y && sudo apt install -y curl software-properties-common git

# Install Node.js v23
echo -e "${YELLOW}${EMOJI_DOWNLOAD} Installing Node.js v23...${RESET}"
curl -sL https://deb.nodesource.com/setup_23.x | sudo bash -
sudo apt install -y nodejs

# Clone repository
echo -e "${YELLOW}${EMOJI_DOWNLOAD} Cloning PowerPort panel repository...${RESET}"
if git clone https://github.com/PowerPort-Labs/panel.git; then
  cd panel || { echo -e "${RED}${EMOJI_ERROR} Failed to enter 'panel' directory.${RESET}"; exit 1; }
else
  echo -e "${RED}${EMOJI_ERROR} Failed to clone repository.${RESET}"
  exit 1
fi

# Install dependencies and build
echo -e "${CYAN}${EMOJI_RUN} Installing dependencies...${RESET}"
npm install

echo -e "${CYAN}${EMOJI_RUN} Building user interface...${RESET}"
npm run build:user

echo -e "${CYAN}${EMOJI_RUN} Seeding database...${RESET}"
npm run seed

# Run the panel
echo -e "${CYAN}${EMOJI_RUN} Starting PowerPort Panel...${RESET}"
node .

# Completion message
echo -e "\n${GREEN}${EMOJI_OK} PowerPort Panel installation complete!${RESET}"
echo -e "${GREEN}${EMOJI_WEB} Access it via: ${BOLD}http://localhost:3001${RESET}"

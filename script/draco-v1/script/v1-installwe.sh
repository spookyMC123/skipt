#!/bin/bash

# Define Colors
GREEN="\e[32m"
YELLOW="\e[33m"
CYAN="\e[36m"
RED="\e[31m"
RESET="\e[0m"
BOLD="\e[1m"

# Emojis
EMOJI_DOWNLOAD="📦"
EMOJI_NODE="🟩"
EMOJI_GIT="🔧"
EMOJI_INSTALL="⚙️"
EMOJI_SUCCESS="✅"
EMOJI_ERROR="❌"

# Clear the screen
clear

# Step 1: Installing Node.js
echo -e "${CYAN}${EMOJI_DOWNLOAD} ${BOLD}Installing Node.js 20.x...${RESET}"
curl -sL https://deb.nodesource.com/setup_20.x | sudo bash - >/dev/null 2>&1
if sudo apt-get install -y nodejs >/dev/null 2>&1; then
  echo -e "${GREEN}${EMOJI_SUCCESS} Node.js installed successfully!${RESET}"
else
  echo -e "${RED}${EMOJI_ERROR} Failed to install Node.js.${RESET}"
  exit 1
fi

# Step 2: Cloning Panel Repository
echo -e "${YELLOW}${EMOJI_GIT} Cloning DragonLabs Panel v1.0.0...${RESET}"
if git clone https://github.com/dragonlabsdev/panel-v1.0.0.git >/dev/null 2>&1; then
  cd panel-v1.0.0 || exit 1
  echo -e "${GREEN}${EMOJI_SUCCESS} Repository cloned successfully!${RESET}"
else
  echo -e "${RED}${EMOJI_ERROR} Failed to clone the panel repository.${RESET}"
  exit 1
fi

# Step 3: Installing Dependencies
echo -e "${CYAN}${EMOJI_INSTALL} Installing NPM dependencies...${RESET}"
if npm install >/dev/null 2>&1; then
  echo -e "${GREEN}${EMOJI_SUCCESS} Dependencies installed!${RESET}"
else
  echo -e "${RED}${EMOJI_ERROR} npm install failed.${RESET}"
  exit 1
fi

# Step 4: Database Setup & Admin Creation
echo -e "${YELLOW}${EMOJI_INSTALL} Seeding database and creating user...${RESET}"
npm run seed && npm run createUser

# Step 5: Launch Panel
echo -e "${GREEN}${EMOJI_NODE} Starting the Panel...${RESET}"
node .


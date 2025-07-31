#!/bin/bash

# ==========================
#  PufferPanel Installer
#  Author: InfinityForge
# ==========================

# Define colors
GREEN="\e[32m"
YELLOW="\e[33m"
CYAN="\e[36m"
RED="\e[31m"
RESET="\e[0m"
BOLD="\e[1m"

# Emojis
EMOJI_OK="✅"
EMOJI_WARN="⚠️"
EMOJI_ERROR="❌"
EMOJI_RUN="🚀"
EMOJI_DONE="🎉"

# Clear terminal
clear

# Header
echo -e "${CYAN}${BOLD}=========================================${RESET}"
echo -e "${CYAN}${BOLD}    🚀 Installing gitPufferPanel         ${RESET}"
echo -e "${CYAN}${BOLD}=========================================${RESET}"

# Step 1: Install required tools
echo -e "\n${YELLOW}${EMOJI_RUN} Installing required dependencies...${RESET}"
sudo apt update -y
sudo apt install -y curl gnupg2 lsb-release software-properties-common || {
  echo -e "${RED}${EMOJI_ERROR} Failed to install dependencies.${RESET}"
  exit 1
}

# Step 2: Add PufferPanel repo
echo -e "\n${YELLOW}${EMOJI_RUN} Adding PufferPanel repository...${RESET}"
curl -s https://packagecloud.io/install/repositories/pufferpanel/pufferpanel/script.deb.sh | sudo bash || {
  echo -e "${RED}${EMOJI_ERROR} Failed to add PufferPanel repo.${RESET}"
  exit 1
}

# Step 3: Install PufferPanel
echo -e "\n${YELLOW}${EMOJI_RUN} Installing PufferPanel...${RESET}"
sudo apt update
sudo apt install -y pufferpanel || {
  echo -e "${RED}${EMOJI_ERROR} Failed to install PufferPanel.${RESET}"
  exit 1
}

# Step 4: Create admin user
echo -e "\n${CYAN}🔐 Creating admin user...${RESET}"
sudo pufferpanel user add || {
  echo -e "${RED}${EMOJI_ERROR} Failed to create PufferPanel user.${RESET}"
  exit 1
}

# Step 5: Run panel in background
echo -e "\n${CYAN}${EMOJI_RUN} Starting PufferPanel in background...${RESET}"
nohup sudo pufferpanel run > panel.log 2>&1 &

# Final message
echo -e "\n${GREEN}${EMOJI_DONE} PufferPanel installation completed!${RESET}"
echo -e "${YELLOW}${EMOJI_WARN} Note: PufferPanel runs on port 8080.${RESET}"
echo -e "${CYAN}Use an HTTP tunneling service like ${BOLD}ngrok, localhost.run, pinggy.io${RESET}${CYAN} to access the panel from Codespaces or remote environments.${RESET}"
echo -e "\nTo restart panel manually, run:\n  ${BOLD}sudo pufferpanel run${RESET}\n"


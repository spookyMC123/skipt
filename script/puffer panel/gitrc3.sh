#!/bin/bash

# ==========================
#  PufferPanel RC Installer (no systemctl)
#  Version: v3.0.0-rc.14
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
echo -e "${CYAN}${BOLD}==============================================${RESET}"
echo -e "${CYAN}${BOLD}   ${EMOJI_RUN} Installing PufferPanel v3.0.0-rc.14     ${RESET}"
echo -e "${CYAN}${BOLD}==============================================${RESET}"

# Step 1: Install dependencies
echo -e "\n${YELLOW}${EMOJI_RUN} Installing dependencies...${RESET}"
sudo apt update -y
sudo apt install -y curl tar || {
  echo -e "${RED}${EMOJI_ERROR} Failed to install dependencies.${RESET}"
  exit 1
}

# Step 2: Download PufferPanel v3
echo -e "\n${YELLOW}${EMOJI_RUN} Downloading PufferPanel v3.0.0-rc.14...${RESET}"
curl -Lo pufferpanel.tar.gz https://github.com/pufferpanel/pufferpanel/releases/download/v3.0.0-rc.14/pufferpanel-linux-amd64.tar.gz || {
  echo -e "${RED}${EMOJI_ERROR} Failed to download PufferPanel.${RESET}"
  exit 1
}

# Step 3: Extract and install
tar -xzf pufferpanel.tar.gz
chmod +x pufferpanel
sudo mv pufferpanel /usr/local/bin/pufferpanel

# Step 4: Prepare panel config folders
mkdir -p ~/pufferpanel-data/email
touch ~/pufferpanel-data/email/emails.json
echo "{}" > ~/pufferpanel-data/email/emails.json

# Step 5: Add admin user
echo -e "\n${CYAN}🔐 Creating admin user...${RESET}"
pufferpanel user add

# Step 6: Run the panel in background
echo -e "\n${CYAN}${EMOJI_RUN} Starting PufferPanel in background...${RESET}"
nohup pufferpanel run > ~/pufferpanel-data/panel.log 2>&1 &

# Step 7: Confirm version
echo -e "\n${YELLOW}${EMOJI_RUN} Checking installed version...${RESET}"
pufferpanel version

# Final Message
echo -e "\n${GREEN}${EMOJI_DONE} PufferPanel v3.0.0-rc.14 installation complete!${RESET}"
echo -e "${YELLOW}${EMOJI_WARN} Access panel at: http://localhost:8080 or use a tunnel.${RESET}"
echo -e "${CYAN}To restart panel manually:${RESET}"
echo -e "  ${BOLD}pkill pufferpanel${RESET}"
echo -e "  ${BOLD}nohup pufferpanel run > ~/pufferpanel-data/panel.log 2>&1 &${RESET}"

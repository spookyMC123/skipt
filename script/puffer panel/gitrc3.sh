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

clear
echo -e "${CYAN}${BOLD}==============================================${RESET}"
echo -e "${CYAN}${BOLD}   ${EMOJI_RUN} Installing PufferPanel v3.0.0-rc.14     ${RESET}"
echo -e "${CYAN}${BOLD}==============================================${RESET}"

# Step 1: Install dependencies
echo -e "\n${YELLOW}${EMOJI_RUN} Installing dependencies...${RESET}"
sudo apt update -y
sudo apt install -y curl gnupg2 lsb-release software-properties-common || {
  echo -e "${RED}${EMOJI_ERROR} Failed to install dependencies.${RESET}"
  exit 1
}

# Step 2: Download PufferPanel .deb package
echo -e "\n${YELLOW}${EMOJI_RUN} Downloading PufferPanel v3.0.0-rc.14 DEB package...${RESET}"
curl -LO https://github.com/pufferpanel/pufferpanel/releases/download/v3.0.0-rc.14/pufferpanel_3.0.0-rc.14_amd64.deb || {
  echo -e "${RED}${EMOJI_ERROR} Download failed.${RESET}"
  exit 1
}

# Step 3: Install the package
echo -e "\n${YELLOW}${EMOJI_RUN} Installing PufferPanel package...${RESET}"
sudo dpkg -i pufferpanel_3.0.0-rc.14_amd64.deb
sudo apt-get install -f -y

# Step 4: Create config folders if missing
echo -e "\n${YELLOW}${EMOJI_RUN} Ensuring config directories exist...${RESET}"
mkdir -p ~/pufferpanel-data/email
touch ~/pufferpanel-data/email/emails.json
echo "{}" > ~/pufferpanel-data/email/emails.json

# Step 5: Add admin user
echo -e "\n${CYAN}🔐 Creating admin user...${RESET}"
sudo pufferpanel user add || {
  echo -e "${RED}${EMOJI_ERROR} Failed to create admin user. Please run 'sudo pufferpanel user add' manually.${RESET}"
}

# Step 6: Run panel manually in background
echo -e "\n${CYAN}${EMOJI_RUN} Starting PufferPanel in background...${RESET}"
nohup sudo pufferpanel run --config ~/pufferpanel-data/config.json > ~/pufferpanel-data/panel.log 2>&1 &

# Step 7: Check version
echo -e "\n${YELLOW}${EMOJI_RUN} Verifying installed version...${RESET}"
pufferpanel version

# Final message
echo -e "\n${GREEN}${EMOJI_DONE} PufferPanel v3.0.0-rc.14 installed and running without systemd!${RESET}"
echo -e "${YELLOW}${EMOJI_WARN} Panel runs at http://localhost:8080 or use a tunnel if remote.${RESET}"
echo -e "${CYAN}To restart panel manually:${RESET}"
echo -e "  ${BOLD}pkill pufferpanel${RESET}"
echo -e "  ${BOLD}nohup sudo pufferpanel run --config ~/pufferpanel-data/config.json > ~/pufferpanel-data/panel.log 2>&1 &${RESET}"

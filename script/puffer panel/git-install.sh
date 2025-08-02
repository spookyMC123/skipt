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
echo -e "${CYAN}${BOLD}    ${EMOJI_RUN} Installing PufferPanel gitInstaller    ${RESET}"
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

# Step 5: Create missing email config to prevent crash
echo -e "\n${YELLOW}${EMOJI_WARN} Creating missing email config folder and file to prevent startup errors...${RESET}"
mkdir -p email
if [ ! -f email/emails.json ]; then
  echo '{}' > email/emails.json
  echo -e "${GREEN}Created email/emails.json${RESET}"
else
  echo -e "${CYAN}email/emails.json already exists.${RESET}"
fi

# Step 6: Run panel in background from current directory (so email/emails.json is found)
echo -e "\n${CYAN}${EMOJI_RUN} Starting PufferPanel in background...${RESET}"
nohup sudo pufferpanel run > panel.log 2>&1 &

# Final message
echo -e "\n${GREEN}${EMOJI_DONE} PufferPanel installation completed!${RESET}"
echo -e "${YELLOW}${EMOJI_WARN} Note: PufferPanel runs on port 8080.${RESET}"

echo -e "${CYAN}Use an HTTP tunneling service like:"
echo -e "  ${BOLD}ngrok${RESET}${CYAN}, localhost.run, or pinggy.io"
echo -e "to access the panel from Codespaces or remote environments.${RESET}"

echo -e "\nTo restart the panel manually, run:"
echo -e "  ${BOLD}sudo pkill pufferpanel${RESET}"
echo -e "  ${BOLD}background run cmd :nohup sudo pufferpanel run > panel.log 2>&1 &${RESET}"
echo -e "  ${BOLD}or teminal run ${RESET}"
echo -e "  ${BOLD}sudo pufferpanel run${RESET}"

sleep 3
echo -e "\n${GREEN}${EMOJI_OK} Installation Completed Successfully! Enjoy your panel. ${EMOJI_RUN}${RESET}"

#!/bin/bash

# ==========================
#  PufferPanel RC Installer (DEB)
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
echo -e "${CYAN}${BOLD}=========================================${RESET}"
echo -e "${CYAN}${BOLD}    ${EMOJI_RUN} Installing PufferPanel v3.0.0 RC    ${RESET}"
echo -e "${CYAN}${BOLD}=========================================${RESET}"

# Step 1: Dependencies
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
sudo mkdir -p /etc/pufferpanel /var/lib/pufferpanel
sudo touch /etc/pufferpanel/config.json

# Step 5: Setup systemd service (should be installed by package, but just in case)
echo -e "\n${YELLOW}${EMOJI_RUN} Setting up systemd service...${RESET}"
sudo tee /etc/systemd/system/pufferpanel.service > /dev/null <<EOF
[Unit]
Description=PufferPanel Daemon
After=network.target

[Service]
Type=simple
ExecStart=/usr/bin/pufferpanel run
WorkingDirectory=/etc/pufferpanel
Restart=always
User=root

[Install]
WantedBy=multi-user.target
EOF

sudo systemctl daemon-reload
sudo systemctl enable pufferpanel

# Step 6: Add admin user
echo -e "\n${CYAN}🔐 Creating admin user...${RESET}"
sudo pufferpanel user add || {
  echo -e "${RED}${EMOJI_ERROR} Failed to create admin user. Please run 'sudo pufferpanel user add' manually.${RESET}"
}

# Step 7: Start panel
echo -e "\n${YELLOW}${EMOJI_RUN} Starting PufferPanel service...${RESET}"
sudo systemctl start pufferpanel

# Step 8: Check version
echo -e "\n${YELLOW}${EMOJI_RUN} Verifying version...${RESET}"
pufferpanel version

# Final message
echo -e "\n${GREEN}${EMOJI_DONE} PufferPanel v3.0.0-rc.14 installed and running!${RESET}"
echo -e "${YELLOW}${EMOJI_WARN} Panel runs at http://<your-ip>:8080${RESET}"


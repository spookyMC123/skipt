#!/bin/bash

# ==========================
#  PufferPanel RC Installer
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
sudo apt install -y curl tar || {
  echo -e "${RED}${EMOJI_ERROR} Failed to install dependencies.${RESET}"
  exit 1
}

# Step 2: Download latest RC binary
echo -e "\n${YELLOW}${EMOJI_RUN} Downloading PufferPanel v3.0.0-rc.14...${RESET}"
curl -Lo pufferpanel.tar.gz https://github.com/pufferpanel/pufferpanel/releases/download/v3.0.0-rc.14/pufferpanel-linux-amd64.tar.gz || {
  echo -e "${RED}${EMOJI_ERROR} Download failed.${RESET}"
  exit 1
}

# Step 3: Extract and install
tar -xzf pufferpanel.tar.gz
chmod +x pufferpanel
sudo mv pufferpanel /usr/sbin/pufferpanel

# Step 4: Setup systemd service
echo -e "\n${YELLOW}${EMOJI_RUN} Setting up systemd service...${RESET}"
sudo tee /etc/systemd/system/pufferpanel.service > /dev/null <<EOF
[Unit]
Description=PufferPanel Daemon
After=network.target

[Service]
Type=simple
ExecStart=/usr/sbin/pufferpanel run
WorkingDirectory=/etc/pufferpanel
Restart=always
User=root

[Install]
WantedBy=multi-user.target
EOF

# Step 5: Create config folders
sudo mkdir -p /etc/pufferpanel /var/lib/pufferpanel
sudo touch /etc/pufferpanel/config.json

# Step 6: Add admin user
echo -e "\n${CYAN}🔐 Creating admin user...${RESET}"
sudo pufferpanel user add

# Step 7: Start panel
sudo systemctl daemon-reexec
sudo systemctl daemon-reload
sudo systemctl enable pufferpanel
sudo systemctl start pufferpanel

# Step 8: Check version
echo -e "\n${YELLOW}${EMOJI_RUN} Verifying version...${RESET}"
pufferpanel version

# Final
echo -e "\n${GREEN}${EMOJI_DONE} PufferPanel v3.0.0-rc.14 installed and running!${RESET}"
echo -e "${YELLOW}${EMOJI_WARN} Panel runs at http://<your-ip>:8080${RESET}"

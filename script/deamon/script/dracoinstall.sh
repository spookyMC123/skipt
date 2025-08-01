#!/bin/bash

#===============================================================
# 🚀 Draco Panel v3 Installer - Powered by InfinityForge 🛡️
# Author: spookyMC123 | https://github.com/dragonlabsdev
#===============================================================

# Define Colors & Formatting
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
EMOJI_ZIP="📦"
EMOJI_DONE="🏁"

# Function to handle fatal errors
function error_exit {
  echo -e "${RED}${EMOJI_ERROR} ${1}${RESET}"
  exit 1
}

# Ensure running as root
if [ "$EUID" -ne 0 ]; then
  error_exit "Please run this installer as root or with sudo privileges."
fi

# Clear screen for a clean experience
clear

# Header
echo -e "${CYAN}${BOLD}"
echo "╔═══════════════════════════════════════════════╗"
echo "║        🚀 Draco deamon - Automated Setup      ║"
echo "║         Crafted by InfinityForge & Team       ║"
echo "╚═══════════════════════════════════════════════╝"
echo -e "${RESET}"

# Step 1: Update APT
echo -e "${CYAN}${EMOJI_INFO} Updating package lists...${RESET}"
apt update -y || error_exit "Failed to update APT repositories."

# Step 2: Install Git, Curl, Zip, Unzip
echo -e "${CYAN}${EMOJI_INFO} Installing dependencies (git, curl, zip)...${RESET}"
apt install -y git curl zip unzip || error_exit "Dependency installation failed."

# Step 3: Install Node.js LTS (v20)
if ! command -v node &> /dev/null; then
  echo -e "${CYAN}${EMOJI_NODE} Installing Node.js v20 LTS...${RESET}"
  curl -fsSL https://deb.nodesource.com/setup_20.x | bash - || error_exit "Failed to fetch Node.js setup script."
  apt install -y nodejs || error_exit "Node.js installation failed."
else
  echo -e "${GREEN}${EMOJI_OK} Node.js is already installed. Skipping...${RESET}"
fi

# Step 4: Clone the repository
echo -e "${CYAN}${EMOJI_GIT} Cloning Draco Panel repository...${RESET}"
git clone https://github.com/dragonlabsdev/daemon.git || error_exit "Git clone failed. Check your internet or repo URL."
cd daemon || error_exit "Failed to enter 'daemon' directory."

# Step 5: Extract panel.zip
echo -e "${CYAN}${EMOJI_ZIP} Extracting panel files from panel.zip...${RESET}"
unzip -q deamon.zip || error_exit "Failed to unzip daemon.zip."
cd daemon || error_exit "Failed to enter extracted 'daemon' directory."

# Step 6: Install dependencies and configure
echo -e "${CYAN}${EMOJI_INFO} Installing Node.js packages...${RESET}"
npm install || error_exit "npm install failed."

# Manual Instructions
echo -e "\n${RED}${BOLD}====================== Manual Instructions ======================${RESET}"
echo -e "${BG_BLUE}🔑 1. Configure your token:${RESET}"
echo -e "${BG_BLUE}   👉 Visit: https://panel.com/admin/node${RESET}"
echo -e "${BG_BLUE}   Paste the generated token here in your terminal${RESET}"
echo ""
echo -e "${BG_BLUE}🚀 2. Start the Daemon:${RESET}"
echo -e "${BG_BLUE}   👉 Run: ${CYAN}node .${RESET}"
echo -e "${RED}=================================================================${RESET}"
# Done
echo -e "\n${GREEN}${EMOJI_SUCCESS} Daemon installed successfully!${RESET}"

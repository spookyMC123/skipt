#!/bin/bash

#==================================================================
# 🌀 Daemon Installer Script - by spookyMC123 @ InfinityForge
#==================================================================

# Define Colors
BG_BLUE="\e[44m"
GREEN="\e[32m"
YELLOW="\e[33m"
CYAN="\e[36m"
RED="\e[31m"
RESET="\e[0m"
BOLD="\e[1m"

# Emojis
EMOJI_START="🚀"
EMOJI_DOCKER="🐳"
EMOJI_NODE="🟩"
EMOJI_GIT="🔧"
EMOJI_INSTALL="📦"
EMOJI_INFO="ℹ️"
EMOJI_SUCCESS="✅"
EMOJI_ERROR="❌"

# Clear screen
clear

# Header
echo -e "${CYAN}${BOLD}"
echo "╔══════════════════════════════════════════════════════╗"
echo "║         🌀 Vortex Daemon - Automated Installer        ║"
echo "║            Crafted with ⚡ by InfinityForge           ║"
echo "╚══════════════════════════════════════════════════════╝"
echo -e "${RESET}"

# Step 1: Begin Installation
echo -e "${YELLOW}${EMOJI_START} Starting installation process...${RESET}"

# Step 2: Install Docker
echo -e "${CYAN}${EMOJI_DOCKER} Installing Docker...${RESET}"
curl -sSL https://get.docker.com/ | CHANNEL=stable bash || {
  echo -e "${RED}${EMOJI_ERROR} Failed to install Docker.${RESET}"
  exit 1
}

# Step 3: Update package list
echo -e "${CYAN}${EMOJI_INFO} Updating package list...${RESET}"
sudo apt update -y || {
  echo -e "${RED}${EMOJI_ERROR} Failed to update packages.${RESET}"
  exit 1
}

# Step 4: Install Node.js & Git
echo -e "${CYAN}${EMOJI_NODE} Installing Node.js and Git...${RESET}"
sudo apt install -y nodejs git || {
  echo -e "${RED}${EMOJI_ERROR} Failed to install Node.js and Git.${RESET}"
  exit 1
}

# Step 5: Clone Daemon Repo
echo -e "${CYAN}${EMOJI_GIT} Cloning the Vortex Daemon repository...${RESET}"
git clone https://github.com/PowerPort-Labs/daemon.git || {
  echo -e "${RED}${EMOJI_ERROR} Failed to clone repository.${RESET}"
  exit 1
}
cd daemon || {
  echo -e "${RED}${EMOJI_ERROR} Failed to enter project directory.${RESET}"
  exit 1
}

# Step 6: Install Dependencies
echo -e "${CYAN}${EMOJI_INSTALL} Installing npm dependencies...${RESET}"
npm install || {
  echo -e "${RED}${EMOJI_ERROR} npm install failed.${RESET}"
  exit 1
}

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
echo -e "\n${GREEN}${EMOJI_SUCCESS} Hydra Daemon installed successfully!${RESET}"

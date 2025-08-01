#!/bin/bash

# ==========================
#  Pterodactyl Installer
#  Author: InfinityForge
#  Version: Pro Edition
# ==========================

# Define colors
GREEN="\e[32m"
YELLOW="\e[33m"
CYAN="\e[36m"
RED="\e[31m"
RESET="\e[0m"
BOLD="\e[1m"
BG_BLUE="\e[44m"

# Emojis
EMOJI_START="🚀"
EMOJI_OK="✅"
EMOJI_ERROR="❌"
EMOJI_BACK="↩️"
EMOJI_ARROW="➡️"
EMOJI_INPUT="⌨️"

# Clear screen
clear

# Header
echo -e "${CYAN}${BOLD}=========================================${RESET}"
echo -e "${CYAN}${BOLD}         🚀 Deamon Installer         ${RESET}"
echo -e "${CYAN}${BOLD}=========================================${RESET}\n"

# Menu
echo -e "${YELLOW}${BOLD}Choose an installation option:${RESET}"
echo -e "${BG_BLUE} 1 ${RESET} ${EMOJI_ARROW} Install ${BOLD}Vortex-Deamon ()${RESET}"
echo -e "${BG_BLUE} 2 ${RESET} ${EMOJI_ARROW} Install ${BOLD}Pterodactyl 2 (GitHub, no IPv4)${RESET}"
echo -e "${BG_BLUE} 0 ${RESET} ${EMOJI_BACK} Return to Main Panel Installer"

echo -ne "\n${CYAN}${EMOJI_INPUT} Enter your choice [0-2]: ${RESET}"
read -r choice

# Execute selected option
case "$choice" in
  1)
    echo -e "\n${GREEN}${EMOJI_START} Installing Vortex-Deamon(${EMOJI_ARROW}best but buggy)...${RESET}"
    sleep 1
    bash <(curl -fsSL https://github.com/spookyMC123/skipt/raw/refs/heads/main/script/deamon/script/vortexinstall.sh) || {
    echo -e "${RED}${EMOJI_ERROR} Installation failed. Please check your network or try again.${RESET}"
    sleep 2
    echo -e "\n${RED}${EMOJI_ERROR}Backing${RESET}"
    bash <(curl -fsSL https://github.com/spookyMC123/skipt/raw/refs/heads/main/script/ptrodactyl/install.sh)
    }
    ;;
  2)
    echo -e "\n${GREEN}${EMOJI_START} Installing Pterodactyl 2 (GitHub version)...${RESET}"
    sleep 1
    bash <(curl -fsSL https://raw.githubusercontent.com/spookyMC123/pterodactylpaneleasyinstall/main/ptero.se) || {
    echo -e "${RED}${EMOJI_ERROR} Installation failed. Please check your connection or script source.${RESET}"
    sleep 2
    echo -e "\n${RED}${EMOJI_ERROR}Backing${RESET}"
    bash <(curl -fsSL https://github.com/spookyMC123/skipt/raw/refs/heads/main/script/ptrodactyl/install.sh)
    }
    ;;
   3)
    echo -e "\n${GREEN}${EMOJI_START} Installing Vortex-Deamon(${EMOJI_ARROW}best but buggy)...${RESET}"
    sleep 1
    bash <(curl -fsSL https://github.com/spookyMC123/skipt/raw/refs/heads/main/script/deamon/script/install.sh) || {
    echo -e "${RED}${EMOJI_ERROR} Installation failed. Please check your network or try again.${RESET}"
    sleep 2
    echo -e "\n${RED}${EMOJI_ERROR}Backing${RESET}"
    bash <(curl -fsSL https://github.com/spookyMC123/skipt/raw/refs/heads/main/script/ptrodactyl/install.sh)
    }
    ;;
   4)
    echo -e "\n${GREEN}${EMOJI_START} Installing Vortex-Deamon(${EMOJI_ARROW}best but buggy)...${RESET}"
    sleep 1
    bash <(curl -fsSL https://github.com/spookyMC123/skipt/raw/refs/heads/main/script/deamon/script/install.sh) || {
    echo -e "${RED}${EMOJI_ERROR} Installation failed. Please check your network or try again.${RESET}"
    sleep 2
    echo -e "\n${RED}${EMOJI_ERROR}Backing${RESET}"
    bash <(curl -fsSL https://github.com/spookyMC123/skipt/raw/refs/heads/main/script/ptrodactyl/install.sh)
    }
    ;;
   5)
    echo -e "\n${GREEN}${EMOJI_START} Installing Vortex-Deamon(${EMOJI_ARROW}best but buggy)...${RESET}"
    sleep 1
    bash <(curl -fsSL https://github.com/spookyMC123/skipt/raw/refs/heads/main/script/deamon/script/install.sh) || {
    echo -e "${RED}${EMOJI_ERROR} Installation failed. Please check your network or try again.${RESET}"
    sleep 2
    echo -e "\n${RED}${EMOJI_ERROR}Backing${RESET}"
    bash <(curl -fsSL https://github.com/spookyMC123/skipt/raw/refs/heads/main/script/ptrodactyl/install.sh)
    }
    ;;
  0)
    echo -e "\n${YELLOW}${EMOJI_BACK} Redirecting to Main Installer...${RESET}"
    sleep 1
    bash <(curl -fsSL https://github.com/spookyMC123/panel-installer/raw/refs/heads/main/installer.sh)
    ;;
  *)
    echo -e "\n${RED}${EMOJI_ERROR} Invalid input! Please run the script again and choose 0, 1, or 2.${RESET}"
    sleep 2
    echo -e "\n${RED}${EMOJI_ERROR}Backing${RESET}"
    bash <(curl -fsSL https://github.com/spookyMC123/skipt/raw/refs/heads/main/script/ptrodactyl/install.sh)
    ;;
esac

# Success message
echo -e "\n${CYAN}${BOLD}===========================================${RESET}"
echo -e "${GREEN}${EMOJI_OK} Deamon installation completed successfully!${RESET}"
echo -e "${CYAN}${BOLD}===========================================${RESET}"

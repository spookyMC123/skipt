#!/bin/bash

# Define colors
GREEN="\e[32m"
YELLOW="\e[33m"
CYAN="\e[36m"
RED="\e[31m"
GRAY="\e[90m"
RESET="\e[0m"
BOLD="\e[1m"
BRIGHT_GREEN="\e[92m"
BRIGHT_YELLOW="\e[93m"
BRIGHT_CYAN="\e[96m"

# Emojis
EMOJI_GEAR="⚙️"
EMOJI_ROCKET="🚀"
EMOJI_CHECK="✅"
EMOJI_BACK="↩️"
EMOJI_WARNING="⚠️"
EMOJI_MENU="📋"
EMOJI_PRO="🛡️"

# Clear the terminal
clear

# Installer Header
echo -e "${CYAN}${BOLD}"
echo "╔══════════════════════════════════════╗"
echo "║      ${EMOJI_GEAR} Draco Panel Installer       ║"
echo "╚══════════════════════════════════════╝"
echo -e "${RESET}"

# Menu options
echo -e "${YELLOW}${BOLD}${EMOJI_MENU} Select a version to install:${RESET}"
echo -e "${GREEN} 1)${RESET} Install ${BOLD}Draco Panel v1${RESET}        ${GRAY}${EMOJI_ROCKET} Stable Starter"
echo -e "${GREEN} 2)${RESET} Install ${BOLD}Draco Panel v2${RESET}        ${GRAY}${EMOJI_GEAR} Enhanced Build"
echo -e "${GREEN} 3)${RESET} Install ${BOLD}Draco Panel v3${RESET}        ${GRAY}${EMOJI_ROCKET} Latest with Features"
echo -e "${GREEN} 4)${RESET} Install ${BOLD}PRO Wings Daemon${RESET}       ${GRAY}${EMOJI_PRO} Optimized Daemon"
echo -e "${GREEN} 0)${RESET} ${BOLD}Back to Panel Installer${RESET}      ${GRAY}${EMOJI_BACK} Main Menu"

# User Input
echo -ne "\n${CYAN}${BOLD}Enter your choice [0-4]: ${RESET}"
read -r choice

# Execute selected option
case $choice in
    1)
        echo -e "${BRIGHT_GREEN}${EMOJI_CHECK} Installing Draco Panel v1...${RESET}"
        bash <(curl -fsSL https://raw.githubusercontent.com/spookyMC123/panel-installer/refs/heads/main/script/draco-v1/script/v1-installwe.sh)
        ;;
    2)
        echo -e "${BRIGHT_GREEN}${EMOJI_CHECK} Installing Draco Panel v2...${RESET}"
        bash <(curl -fsSL https://github.com/spookyMC123/panel-installer/raw/refs/heads/main/script/draco-v1/script/v2installwe.sh)
        ;;
    3)
        echo -e "${BRIGHT_GREEN}${EMOJI_CHECK} Installing Draco Panel v3...${RESET}"
        bash <(curl -fsSL https://github.com/spookyMC123/panel-installer/raw/refs/heads/main/script/draco-v1/script/v3-installwe.sh)
        ;;
    4)
        echo -e "${BRIGHT_GREEN}${EMOJI_CHECK} Installing PRO Wings Daemon...${RESET}"
        bash <(curl -fsSL https://github.com/spookyMC123/panel-installer/raw/refs/heads/main/script/deamon/install.sh)
        ;;
    0)
        echo -e "${YELLOW}${EMOJI_BACK} Returning to main panel installer...${RESET}"
        sleep 1
        bash <(curl -fsSL https://github.com/spookyMC123/panel-installer/raw/refs/heads/main/installer.sh)
        ;;
    *)
        echo -e "${RED}${EMOJI_WARNING} Invalid choice! Please rerun the script.${RESET}"
        exit 1
        ;;
esac

# Completion message
echo -e "\n${BRIGHT_GREEN}${BOLD}${EMOJI_CHECK} Draco Installer completed successfully!${RESET}"
sleep 2

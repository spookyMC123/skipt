#!/bin/bash

# Define colors and styles
GREEN="\e[32m"
YELLOW="\e[33m"
CYAN="\e[36m"
RED="\e[31m"
RESET="\e[0m"
BOLD="\e[1m"

# Emojis
EMOJI_PANEL="🛠️"
EMOJI_BACK="🔙"
EMOJI_CHECK="✅"
EMOJI_WARN="⚠️"

# Clear screen
clear

# Header
echo -e "${GREEN}${BOLD}==============================${RESET}"
echo -e "${GREEN}${BOLD}         PufferPanel          ${RESET}"
echo -e "${GREEN}${BOLD}==============================${RESET}\n"

# Menu options
echo -e "${YELLOW}${BOLD}Select an option:${RESET}"
echo -e "1) ${EMOJI_PANEL} Install PufferPanel on GitHub"
echo -e "2) ${EMOJI_PANEL} Install PufferPanel on VPS and Codesandbox"
echo -e "0) ${EMOJI_BACK} Back to main installer\n"

# Prompt user input
echo -ne "${CYAN}${BOLD}Enter your choice: ${RESET}"
read -r choice

# Handle user choice
case $choice in
    1)
        echo -e "\n${GREEN}${EMOJI_CHECK} Installing GitHub PufferPanel...${RESET}"
        bash <(curl -fsSL https://github.com/spookyMC123/panel-installer/raw/refs/heads/main/script/puffer%20panel/git-install.sh)
        ;;
    2)
        echo -e "\n${GREEN}${EMOJI_CHECK} Installing VPS and Codesandbox PufferPanel...${RESET}"
        bash <(curl -fsSL https://github.com/spookyMC123/panel-installer/raw/refs/heads/main/script/puffer%20panel/codesandboxvpspufferpanelinstall.sh)
        ;;
    0)
        echo -e "\n${GREEN}${EMOJI_BACK} Returning to main panel installer...${RESET}"
        bash <(curl -fsSL "https://github.com/spookyMC123/panel-installer/raw/refs/heads/main/installer.sh)
        ;;
    *)
        echo -e "\n${RED}${EMOJI_WARN} Invalid choice! Please try again.${RESET}"
        sleep 2
        exec bash $0
        ;;
esac

echo -e "\n${GREEN}${EMOJI_CHECK} PufferPanel installation process completed successfully!${RESET}"



#!/bin/bash

# Define colors and styles
GREEN="\e[32m"
YELLOW="\e[33m"
CYAN="\e[36m"
RED="\e[31m"
RESET="\e[0m"
BOLD="\e[1m"

# Emojis
EMOJI_PANEL="🖥️"
EMOJI_WINGS="🪽"
EMOJI_NODEJS="🟢"
EMOJI_BACK="🔙"
EMOJI_QUESTION="❓"
EMOJI_SUCCESS="✅"
EMOJI_CANCEL="🚫"
EMOJI_WARNING="⚠️"

# Clear the terminal
clear

# Display Installer Header
echo -e "${CYAN}${BOLD}==============================${RESET}"
echo -e "${CYAN}${BOLD}       Skyport Installer       ${RESET}"
echo -e "${CYAN}${BOLD}==============================${RESET}\n"

# Menu options
echo -e "${YELLOW}${BOLD}Select an option:${RESET}"
echo -e "1) ${EMOJI_PANEL} Install Panel"
echo -e "2) ${EMOJI_WINGS} Install Wings"
echo -e "3) ${EMOJI_PANEL} + ${EMOJI_WINGS} Install Panel + Wings"
echo -e "4) ${EMOJI_NODEJS} Install Node.js"
echo -e "0) ${EMOJI_BACK} Back to main Panel Installer\n"

# Prompt user input
read -rp "$(echo -e "${CYAN}${BOLD}Enter your choice: ${RESET}")" choice

# Function to confirm yes/no
confirm() {
  while true; do
    read -rp "$1 ${EMOJI_QUESTION} [yes/no]: " yn
    case $yn in
      yes|YES|y|Y) return 0 ;;
      no|NO|n|N) return 1 ;;
      *) echo -e "${YELLOW}Please answer yes or no.${RESET}" ;;
    esac
  done
}

# Run the selected installation script
case $choice in
  1)
    echo -e "\n${GREEN}${EMOJI_SUCCESS} Installing Skyport Panel...${RESET}"
    bash <(curl -fsSL https://raw.githubusercontent.com/spookyMC123/Skyport-installer/refs/heads/main/scripts/panel.sh)
    ;;
  2)
    echo -e "\n${GREEN}${EMOJI_SUCCESS} Installing Wings...${RESET}"
    bash <(curl -fsSL https://raw.githubusercontent.com/spookyMC123/Skyport-installer/refs/heads/main/scripts/node.sh)
    ;;
  3)
    echo -e "\n${YELLOW}You chose to install Panel + Wings.${RESET}"
    if confirm "Are you sure you want to proceed with installing both?"; then
      echo -e "\n${GREEN}${EMOJI_SUCCESS} Starting Panel installation...${RESET}"
      bash <(curl -fsSL https://raw.githubusercontent.com/spookyMC123/Skyport-installer/refs/heads/main/scripts/panel.sh)
      echo -e "\n${GREEN}${EMOJI_SUCCESS} Starting Wings installation...${RESET}"
      bash <(curl -fsSL https://raw.githubusercontent.com/spookyMC123/Skyport-installer/refs/heads/main/scripts/node.sh)
    else
      echo -e "\n${RED}${EMOJI_CANCEL} Installation cancelled by user.${RESET}"
      bash <(curl -fsSL https://github.com/spookyMC123/skipt/raw/refs/heads/main/script/skyport/installer.sh)
    fi
    ;;
  4)
    echo -e "\n${GREEN}${EMOJI_SUCCESS} Installing Node.js...${RESET}"
    bash <(curl -fsSL https://raw.githubusercontent.com/spookyMC123/Skyport-installer/refs/heads/main/scripts/node.sh)
    ;;
  0)
    echo -e "\n${GREEN}${EMOJI_BACK} Returning to main panel installer...${RESET}"
    bash <(curl -fsSL https://github.com/spookyMC123/panel-installer/raw/refs/heads/main/installer.sh)
    ;;
  *)
    echo -e "\n${RED}${EMOJI_WARNING} Invalid choice! Please run the script again.${RESET}"
    exit 1
    ;;
esac

echo -e "\n${GREEN}${EMOJI_SUCCESS} Skyport Installer process completed successfully!${RESET}"

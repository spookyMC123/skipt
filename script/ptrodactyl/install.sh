#!/bin/bash

# Define colors
GREEN="\e[32m"
YELLOW="\e[33m"
CYAN="\e[36m"
RED="\e[31m"
RESET="\e[0m"
BG_BLUE="\e[44m"

# Clear the terminal
clear

# Display Installer Name
echo -e "${CYAN}==============================${RESET}"
echo -e "${CYAN}     Pterodactyl Installer     ${RESET}"
echo -e "${CYAN}==============================${RESET}"

# Menu options
echo -e "${YELLOW}Select an option:${RESET}"
echo -e "${BG_BLUE}1)${RESET} Install Pterodactyl (IPv4 + Wings)"
echo -e "${BG_BLUE}2)${RESET} Install Pterodactyl 2 (GitHub version, no IPv4)"
echo -e "${BG_BLUE}0)${RESET} Backing"
echo -ne "${YELLOW}Enter your choice: ${RESET}"
read -r choice

# Run the selected installation script
case $choice in
    1)
        echo -e "${GREEN}Installing Pterodactyl Panel (Panel + Wings)...${RESET}"
        bash <(curl -s https://pterodactyl-installer.se/)
        ;;
    2)
        echo -e "${GREEN}Installing Pterodactyl Panel 2...${RESET}"
        bash <(curl -fsSL https://raw.githubusercontent.com/spookyMC123/pterodactylpaneleasyinstall/main/ptero.se)
        ;;
    0)
        echo -e "${GREEN}Backing...${RESET}"
        bash <(curl -fsSL https://github.com/spookyMC123/panel-installer/raw/refs/heads/main/installer.sh)
        ;;
    *)
        echo -e "${RED}Invalid choice! Please run the script again.${RESET}"
        exit 1
        ;;
esac

# Final message
echo -e "${CYAN}==========================================${RESET}"
echo -e "${GREEN} Pterodactyl install process completed! ${RESET}"
echo -e "${CYAN}==========================================${RESET}"


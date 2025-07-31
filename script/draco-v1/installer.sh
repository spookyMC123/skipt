#!/bin/bash

# Define colors
GREEN="\e[32m"
YELLOW="\e[33m"
CYAN="\e[36m"
RED="\e[31m"
RESET="\e[0m"

# Clear the terminal
clear

# Display Installer Name
echo -e "${CYAN}==============================${RESET}"
echo -e "${CYAN}      Dracro-Installer     ${RESET}"
echo -e "${CYAN}==============================${RESET}"

# Menu options
echo -e "${YELLOW}Select an option:${RESET}"
echo "1) Install Panelv1"
echo "2) Install panelv2"
echo "3) Install panelv3"
echo "4) Install pro-wings"
echo "0) back to Panel-installer"
echo -n "Enter your choice: "
read -r choice

# Run the selected installation script
case $choice in
    1)
        echo -e "${GREEN}Installing draco-v1 Panel...${RESET}"
        bash <(curl -fsSL https://raw.githubusercontent.com/spookyMC123/panel-installer/refs/heads/main/script/draco-v1/script/v1-installwe.sh)
        ;;
    2)
        echo -e "${GREEN}Installing draco-v2...${RESET}"
        bash <(curl -fsSL https://github.com/spookyMC123/panel-installer/raw/refs/heads/main/script/draco-v1/script/v2installwe.sh)
        ;;
    3)
        echo -e "${GREEN}Installing draco-v3...${RESET}"
        bash <(curl -fsSL https://github.com/spookyMC123/panel-installer/raw/refs/heads/main/script/draco-v1/script/v3-installwe.sh)
        ;;
    4)
        echo -e "${GREEN}Installing PRO-wings...${RESET}"
        bash <(curl -fsSL https://github.com/spookyMC123/panel-installer/raw/refs/heads/main/script/deamon/install.sh)
        ;;
    0)
        echo -e "${GREEN}backing to panel-installer...${RESET}"
        bash <(curl -fsSL https://github.com/spookyMC123/panel-installer/raw/refs/heads/main/installer.sh)
        ;;
    *)
        echo -e "${RED}Invalid choice! Please run the script again.${RESET}"
        exit 1
        ;;
esac

echo -e "${GREEN}panel-Installer process completed successfully!${RESET}"

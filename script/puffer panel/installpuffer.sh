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
echo -e "${GREEN}==============================${RESET}"
echo -e "${GREEN}         puffer-panel         ${RESET}"
echo -e "${GREEN}==============================${RESET}"

# Menu options
echo -e "${YELLOW}Select an option:${RESET}"
echo "1) Install pufferpanel on github"
echo "2) Install pufferpanel on all vps and codesandbox"
echo "0) Back to installer"
echo -n "Enter your choice: "
read -r choice

# Run the selected installation script
case $choice in
    1)
        echo -e "${GREEN}Installing github pufferPanel...${RESET}"
        bash <(curl -fsSL https://github.com/spookyMC123/panel-installer/raw/refs/heads/main/script/puffer%20panel/git-install.sh)
        ;;
    2)
        echo -e "${GREEN}Installing vps pufferpanel...${RESET}"
        bash <(curl -fsSL https://github.com/spookyMC123/panel-installer/raw/refs/heads/main/script/puffer%20panel/codesandboxvpspufferpanelinstall.sh)
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

echo -e "${GREEN}puffer panel process completed successfully!${RESET}"

#!/bin/bash

# Define Colors
YELLOW="\e[33m"
RED="\e[31m"
CYAN="\e[36m"
RESET="\e[0m"
BOLD="\e[1m"

# Emojis
EMOJI_WARNING="⚠️"
EMOJI_BACK="↩️"
EMOJI_RETRY="🔁"

# Clear the screen
clear

# Display message
echo -e "${YELLOW}${BOLD}${EMOJI_WARNING} Sorry, this panel version is not installable.${RESET}"
echo -e "${CYAN}${BOLD}Please try ${RESET}${BOLD}v1${RESET} or ${BOLD}v3${RESET} instead.${CYAN} ${EMOJI_RETRY}${RESET}"
sleep 2

# Redirect back to Draco panel installer
echo -e "${YELLOW}${EMOJI_BACK} Returning to Draco panel selector...${RESET}"
sleep 2
bash <(curl -fsSL https://github.com/spookyMC123/skipt/raw/refs/heads/main/script/draco-v1/installer.sh)

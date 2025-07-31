

echo -e "${CYAN}oversee install Starting the installation process...${RESET}"

# Install Docker
echo -e "${YELLOW}Installing node.js...${RESET}"
curl -sL https://deb.nodesource.com/setup_20.x | sudo bash -
apt-get install nodejs -y

# Update package lists
echo -e "${YELLOW}Updating package lists...${RESET}"
sudo apt update

# Install Node.js and Git
echo -e "${YELLOW}Installing Node.js and Git...${RESET}"
sudo apt install -y nodejs git

# Clone the skyportd repository
echo -e "${YELLOW}Cloning the Oversee repository...${RESET}"
git clone git clone https://github.com/draco-labes/oversee-fixed.git

# Change to the Oversee directory
cd oversee-fixed
npm install && npm run seed && npm run createUser && node .


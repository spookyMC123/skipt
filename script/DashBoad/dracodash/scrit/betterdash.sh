echo "install pack"
curl -sL https://deb.nodesource.com/setup_20.x | sudo bash -
apt-get install nodejs -y
echo "install dash-v2"
git clone https://github.com/dragonlabsdev/dash.git
echo "runing Dash"
apt install zip -y && unzip dashboard.zip && cd dash && apt install nano -y
npm install
echo -e "${RED}====================== Manual Instructions ======================${RESET}"
echo -e "${BG_BLUE}1. Configure on .env file${RESET}"
echo -e "${BG_BLUE}   to pest in terminal this comand [nano .env]${RESET}"
echo -e "${BG_BLUE} ............................................................${RESET}"
echo ""
echo -e "${BG_BLUE}2. Then Start the Dash:${RESET}"
echo -e "${BG_BLUE}   node .${RESET}"
echo -e "${RED}=================================================================${RESET}"

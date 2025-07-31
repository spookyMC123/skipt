echo "install pack"
curl -sL https://deb.nodesource.com/setup_20.x | sudo bash -
sudo apt-get install nodejs -y
echo "install panel"
git clone https://github.com/dragonlabsdev/panel-v1.0.0.git && cd panel-v1.0.0 && npm install && npm run seed && npm run createUser && node .
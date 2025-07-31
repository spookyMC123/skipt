echo "install pack"
curl -sL https://deb.nodesource.com/setup_20.x | sudo bash -
apt-get install nodejs -y
echo "install dashv1"
git clone https://github.com/dragonlabsdev/panel-v1.0.0.git
echo "runing Dash"
cd panel-v1.0.0
npm install
npm run seed
npm run createUser
node .

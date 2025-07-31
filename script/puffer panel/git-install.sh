
sudo apt install systemctl
curl -s https://packagecloud.io/install/repositories/pufferpanel/pufferpanel/script.deb.sh?any=true | sudo bash
sudo apt update
sudo apt-get install pufferpanel
sudo pufferpanel user add
nohup pufferpanel run > panel.log 2>&1 &

echo "use http tunnel for view panel beause github not support hostin on Codespace"
echo "then run pufferpanel run then run panel at 8080 port"

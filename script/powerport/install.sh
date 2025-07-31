#!/bin/bash

echo "🚀 Installing Powerport Panel..."

# Install dependencies
sudo apt update
sudo apt install -y curl software-properties-common git

# Install Node.js
curl -sL https://deb.nodesource.com/setup_23.x | sudo bash -
sudo apt install -y nodejs

# Clone and build the panel
git clone https://github.com/PowerPort-Labs/panel.git
cd panel

npm install
npm run build:user
npm run seed
node .

echo "✅ Installation complete!"
echo "🌐 Access the panel at: http://localhost:3001"

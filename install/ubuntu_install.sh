# Recommend running this script as a user other than root.
# adduser financier
# usermod -aG sudo financier

# Install couchdb
curl -L https://couchdb.apache.org/repo/bintray-pubkey.asc | sudo apt-key add -
echo "deb https://apache.bintray.com/couchdb-deb bionic main" | sudo tee -a /etc/apt/sources.list
sudo apt update && sudo apt install -y couchdb

# Install node
curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
sudo apt install -y nodejs

# Git
sudo apt install -y git

# Get source code
git clone https://github.com/FarhanOmar/fin.git

# Setup couchdb
cd fin
npm install
node ./install/setup_couchdb.js

# Build
npm run build

# Install node 10.x before installing pm2
curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
sudo apt install -y nodejs

# Daemonize
sudo npm install pm2 -g
sudo pm2 startup
sudo pm2 start ./api/index.js

ip=$(ip -f inet -o addr show eth0|cut -d\  -f 7 | cut -d/ -f 1)

echo ""
echo ""
echo "#################################################################"
echo ""
echo "If there were not any errors above, you can go to the following"
echo "url in your browser to load financier!"
echo ""
echo "http://$ip:8080"
echo ""
echo "#################################################################"

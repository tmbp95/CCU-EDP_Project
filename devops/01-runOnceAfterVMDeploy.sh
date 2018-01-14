#!/bin/bash

chmod a+x ~/ccu/devops/02-runStart.sh

# To solve problems with Nodejs global permissions
mkdir ~/.npm-global
npm config set prefix '~/.npm-global'
sudo echo "export PATH=\$PATH:~/.npm-global/bin" > ~/nodejs.sh
sudo mv ~/nodejs.sh /etc/profile.d/nodejs.sh
sudo chown root.root /etc/profile.d/nodejs.sh
sudo chmod go-wx /etc/profile.d/nodejs.sh

export PATH=$PATH:~/.npm-global/bin
npm install -g loopback-cli http-server

# mysql install

echo "mysql-server mysql-server/root_password password vagrant" | sudo debconf-set-selections
echo "mysql-server mysql-server/root_password_again password vagrant" | sudo debconf-set-selections

sudo apt-get install mysql-server -y

sudo sed -i -e 's/127\.0\.0\.1/0\.0\.0\.0/g' /etc/mysql/my.cnf
sudo service mysql restart

mysql -u root --password=vagrant -e "CREATE USER ist174270@'%' IDENTIFIED BY 'vagrant';"
mysql -u root --password=vagrant -e "GRANT ALL ON ist174270.* TO 'ist174270'@'%';"
mysql -u ist174270 --password=vagrant -e "CREATE DATABASE ist174270;"

mysql -u ist174270 --password=vagrant ist174270 < /home/vagrant/ccu/backend/sql/DBdumpCcuBroker.SQL

#Change port of backend to the same of remote api developemnt
sudo sed -i -e 's/3000/4567/g' /home/vagrant/ccu/backend/server/config.json

# Atom additional addons/plugins (packages)
apm install platformio-ide-terminal
apm install browser-plus

echo 'Please, reboot this virtual machine with "sudo reboot" command.'

exit 0

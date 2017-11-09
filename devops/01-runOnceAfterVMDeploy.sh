#!/bin/bash

# To solve problems with Nodejs global permissions
mkdir ~/.npm-global
npm config set prefix '~/.npm-global'
sudo echo "export PATH=\$PATH:~/.npm-global/bin" > ~/nodejs.sh
sudo mv ~/nodejs.sh /etc/profile.d/nodejs.sh
sudo chown root.root /etc/profile.d/nodejs.sh
sudo chmod go-wx /etc/profile.d/nodejs.sh

# Atom additional addons/plugins (packages)
apm install platformio-ide-terminal
apm install browser-plus

exit 0

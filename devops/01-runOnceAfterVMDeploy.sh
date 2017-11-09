#!/bin/bash

# To solve problems with Nodejs global permissions
mkdir ~/.npm-global
npm config set prefix '~/.npm-global'
sudo echo "export PATH=\$PATH:~/.npm-global/bin" > ~/nodejs.sh
sudo mv ~/nodejs.sh /etc/profile.d/nodejs.sh
sudo chown root.root /etc/profile.d/nodejs.sh
sudo chmod go-wx /etc/profile.d/nodejs.sh

export PATH=$PATH:~/.npm-global/bin
npm install -g grunt-cli yo 
# I commented this, because we need to decide which generator should be used
# (ex. ng-fullstack generator-rest generator-angular)
# npm install -g ng-fullstack

# Atom additional addons/plugins (packages)
apm install platformio-ide-terminal
apm install browser-plus

exit 0

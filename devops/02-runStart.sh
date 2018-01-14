#!/bin/bash
#####################

cd /home/vagrant/ccu/backend
npm install
node . &

cd /home/vagrant/ccu/client/site
http-server &

echo 'To access EDP Broker (Producers) use "http://localhost:8080/" or "http://85.247.219.175:8080/".'

exit 0

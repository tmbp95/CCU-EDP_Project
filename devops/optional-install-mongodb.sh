#!/bin/bash

sudo mkdir /srv/mongodata
sudo docker run --name ccu2017mongodb --restart unless-stopped -d -p 27017:27017 -v /srv/mongodata:/data/db mongo

exit 0

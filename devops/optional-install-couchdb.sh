#!/bin/bash

sudo docker run --name ccucouchdb --restart unless-stopped -p 5984:5984 -d couchdb

exit 0

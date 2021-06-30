#!/bin/bash
sudo apt update
#
sudo apt install dirmngr gnupg apt-transport-https ca-certificates software-properties-common -y
#get GPG key
sudo wget -qO - https://www.mongodb.org/static/pgp/server-4.4.asc | sudo apt-key add -
#create a sources list file
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/4.4 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.4.list
#echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu/dists/xenial/mongodb-org/4.4/multiverse/" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.4.list
sudo add-apt-repository 'deb [arch=amd64] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/4.4 multiverse' -y
#reload package database
sudo apt-get update
#install Mongo
sudo apt-get install -y mongodb-org
#start mongo
sudo systemctl enable mongod.service
sudo service mongod start
sudo systemctl status mongod
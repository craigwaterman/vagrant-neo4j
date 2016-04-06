#!/bin/bash

sudo add-apt-repository -y ppa:openjdk-r/ppa
wget -O - http://debian.neo4j.org/neotechnology.gpg.key | sudo apt-key add -
sudo bash -c "echo 'deb http://debian.neo4j.org/repo stable/' > /etc/apt/sources.list.d/neo4j.list"
sudo apt-get update

sudo apt-get install -y openjdk-8-jdk
sudo apt-get install -y neo4j

sudo echo -e "\nneo4j   soft    nofile  80000\nneo4j   hard    nofile  80000" >> /etc/security/limits.conf
sudo echo -e "\nsession    required   pam_limits.so" >> /etc/pam.d/su

echo "Open file limits have been set but will require a reboot to take effect."

echo "Updating Neo4j Config..."
sudo sed -i 's/#org\.neo4j\.server\.webserver\.address=0\.0\.0\.0/org.neo4j.server.webserver.address=0.0.0.0/' /etc/neo4j/neo4j-server.properties

echo "Restarting Neo4j"
sudo service neo4j-service restart



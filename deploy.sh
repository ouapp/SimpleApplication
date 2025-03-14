#!/usr/bin/env bash

# Update package lists and install Node.js and npm
sudo apt update && sudo apt install nodejs npm -y

# Install pm2, a process manager for Node.js
sudo npm install -g pm2

# Stop any instance of our application currently running
pm2 stop SimpleApplication

# Change directory to the application folder
cd SimpleApplication/

# Install application dependencies
npm install
echo $PRIVATE_KEY > privatekey.pem
echo $SERVER > server.crt

# Start the application using pm2 with the process name simple_app
pm2 start ./bin/www --name SimpleApplication

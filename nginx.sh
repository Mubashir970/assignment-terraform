#!/bin/bash

# This script installs Nginx and configures it to serve a simple HTML page.
# Update package list
sudo apt update 

# Install Nginx
sudo apt install nginx -y  

# Create a simple HTML page
echo "<h1> We are sucessfully downloaded the Nginx and updated </h1>" |sudo tee /var/www/html/index.html

# Restart Nginx to apply changes
sudo systemctl restart nginx

# Enable Nginx to start on boot
sudo systemctl enable nginx

# Print the status of Nginx
sudo systemctl status nginx --no-pager

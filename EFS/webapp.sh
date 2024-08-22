#!/bin/bash
# Update package lists
sudo apt update

# Install Apache, wget, and unzip
sudo apt install apache2 wget unzip -y

# Start Apache service
sudo systemctl start apache2

# Enable Apache to start on boot
sudo systemctl enable apache2

# Change to the /tmp directory
cd /tmp

# Download the website template
wget https://www.tooplate.com/zip-templates/2119_gymso_fitness.zip

# Unzip the downloaded template
unzip -o 2119_gymso_fitness.zip

# Copy the contents of the unzipped folder to the Apache web directory
sudo cp -r 2119_gymso_fitness/* /var/www/html/

# Restart Apache service to apply changes
sudo systemctl restart apache2


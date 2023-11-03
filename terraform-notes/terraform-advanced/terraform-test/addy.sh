#!/bin/bash
sudo amazon-linux-extras install nginx1 -y
sudo yum update -y
sudo chown -R ec2-user:ec2-user /usr/share/nginx/html
sudo systemctl enable nginx
sudo service nginx restart
# sudo apt-get update -y
# sudo apt-get install nginx -y
# sudo chown ubuntu:ubuntu /var/www/html/





#!/bin/bash
sudo yum update -y
sudo yum install httpd -y
sudo service httpd restart
echo "hello world" > /var/www/html/index.html
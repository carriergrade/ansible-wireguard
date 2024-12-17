#!/bin/bash
# Install Docker and dependencies for Amazon Linux
sudo yum update -y
sudo yum install -y docker
sudo systemctl start docker
sudo systemctl enable docker
sudo usermod -aG docker ec2-user

# Install Docker Compose
sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Install Python pip and required packages
sudo yum install -y python3-pip
sudo pip3 install docker

# Restart Docker to ensure all changes take effect
sudo systemctl restart docker

echo "Docker installation complete. Please log out and log back in for group changes to take effect."
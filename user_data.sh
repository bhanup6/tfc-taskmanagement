#!/bin/bash

# Update system
yum update -y

# Install Python 3 and pip
yum install -y python3

# Install Git
yum install -y git

# Install Terraform
yum install -y yum-utils
yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo
yum -y install terraform

# Optional: Install unzip if needed
yum install -y unzip

# Set up virtual environment for Python project
mkdir -p /opt/aws_decom
cd /opt/aws_decom

# Example: clone your repo (replace with actual repo URL if needed)
 git clone https://github.com/your-repo/aws_decom.git .
# OR copy your zipped code and unzip here

# Example: create virtual environment and install requirements (after you push your code)
 python3 -m venv .venv
 source .venv/bin/activate
pip install -r requirements.txt

# Optional: Add environment variables if needed (edit accordingly)
echo "export TFE_TOKEN=ZsDjfVjxEqK1HA.atlasv1.4JGFqa7lql0XpwZjV4ySfyXjDVcs0gwqpg05CdrM5KRy41naUA13WzRw9H9OX9U9ygE" >> /etc/profile.d/aws_decom_env.sh
echo "export AWS_ACCOUNT_ID=123456789012" >> /etc/profile.d/aws_decom_env.sh
echo "export APP_ORG=bhanup6" >> /etc/profile.d/aws_decom_env.sh
echo "export MGMT_ORG=bhanup6" >> /etc/profile.d/aws_decom_env.sh
echo "export MGMT_WS=tfc-taskmanagement" >> /etc/profile.d/aws_decom_env.sh
echo "export APP_WS_LIST=tfc-taskmanagement" >> /etc/profile.d/aws_decom_env.sh
chmod +x /etc/profile.d/aws_decom_env.sh

# Optional: Run the automation script on boot (if ready)
# source /etc/profile.d/aws_decom_env.sh
# python3 /opt/aws_decom/decommission.py > /var/log/decom.log 2>&1

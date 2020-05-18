#!/bin/bash

# Virtual environment for mininet (root user)
echo -e "\n\n#####################################"
echo -e "\nVirtual environment for mininet (root user)"
source /root/.mininet-venv/bin/activate

# Install wheel
echo -e "\n\n#####################################"
echo -e "\n-Installing wheel"
pip3 install wheel &&

# Install mininet
echo -e "\n\n#####################################"
echo -e "\n-Installing mininet"
pip3 install git+https://github.com/mininet/mininet.git

# Install python-hosts
echo -e "\n\n#####################################"
echo -e "\n-Installing python-hosts"
pip3 install python-hosts

# Install python-dotenv
echo -e "\n\n#####################################"
echo -e "\n-Installing python-dotenv"
pip3 install python-dotenv
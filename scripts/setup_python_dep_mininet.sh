#!/bin/bash

# Virtual environment for mininet (root user)
echo -e "\n\n#####################################"
echo -e "\nVirtual environment for mininet (root user)"
source /root/.mininet-venv/bin/activate

# Install mininet
echo -e "\n\n#####################################"
echo -e "\n-Installing mininet"
pip3 install git+https://github.com/mininet/mininet.git &&
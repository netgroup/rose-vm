#!/bin/bash

# Virtual environment for node manager (root user)
echo -e "\n\n#####################################"
echo -e "\nVirtual environment for node manager (root user)"
source /root/.node-mgr-venv/bin/activate

# Install grpcio
echo -e "\n\n#####################################"
echo -e "\n-Installing grpcio"
pip3 install grpcio &&

# Install grpcio-tools
echo -e "\n\n#####################################"
echo -e "\n-Installing grpcio-tools"
pip3 install grpcio-tools &&

# Install pyroute2
echo -e "\n\n#####################################"
echo -e "\n-Installing pyroute2"
pip3 install pyroute2 &&
#!/bin/bash

# Virtual environment for rose
echo -e "\n\n#####################################"
echo -e "\nVirtual environment for rose"
source /home/rose/.rose-venv/bin/activate

# Install wheel
echo -e "\n\n#####################################"
echo -e "\n-Installing wheel"
pip3 install wheel &&

# Install grpcio
echo -e "\n\n#####################################"
echo -e "\n-Installing grpcio"
pip3 install grpcio &&

# Install grpcio-tools
echo -e "\n\n#####################################"
echo -e "\n-Installing grpcio-tools"
pip3 install grpcio-tools &&

# Install python-arango
echo -e "\n\n#####################################"
echo -e "\n-Installing python-arango"
pip3 install python-arango
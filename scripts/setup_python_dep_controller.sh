#!/bin/bash

# Virtual environment for controller (root user)
echo -e "\n\n#####################################"
echo -e "\nVirtual environment for controller (root user)"
source /root/.controller-venv/bin/activate

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

# Install networkx
echo -e "\n\n#####################################"
echo -e "\n-Installing networkx"
pip3 install networkx &&

# Install pyaml
echo -e "\n\n#####################################"
echo -e "\n-Installing pyaml"
pip3 install pyaml &&

# Install pygraphviz
echo -e "\n\n#####################################"
echo -e "\n-Installing pygraphviz"
pip3 install pygraphviz &&

# Install six
echo -e "\n\n#####################################"
echo -e "\n-Installing six"
pip3 install six &&

# Install python-dotenv
echo -e "\n\n#####################################"
echo -e "\n-Installing python-dotenv"
pip3 install python-dotenv

# Install python-arango
echo -e "\n\n#####################################"
echo -e "\n-Installing python-arango"
pip3 install python-arango
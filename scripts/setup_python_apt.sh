#!/bin/bash

# Install python3-dev
echo -e "\n\n#####################################"
echo -e "\n-Installing python3-dev"
sudo apt install -y python3-dev &&

# Install graphviz
echo -e "\n\n#####################################"
echo -e "\n-Installing graphviz"
sudo apt install -y graphviz &&

# Install libgraphviz-dev
echo -e "\n\n#####################################"
echo -e "\n-Installing libgraphviz-dev"
sudo apt install -y libgraphviz-dev &&

# Install mininet
echo -e "\n\n#####################################"
echo -e "\n-Installing mininet"
sudo apt install -y mininet &&
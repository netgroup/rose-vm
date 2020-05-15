#!/bin/bash

# Virtual environment for rose
echo -e "\n\n#####################################"
echo -e "\nVirtual environment for rose"
source /home/rose/.rose-venv/bin/activate

# Install python-arango
echo -e "\n\n#####################################"
echo -e "\n-Installing python-arango"
pip3 install python-arango
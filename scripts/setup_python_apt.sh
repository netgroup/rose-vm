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

# Install tmux
echo -e "\n\n#####################################"
echo -e "\n-Installing tmux"
sudo apt install -y tmux &&

# Install git
echo -e "\n\n#####################################"
echo -e "\n-Installing git"
sudo apt install -y git &&

# Install iperf3
echo -e "\n\n#####################################"
echo -e "\n-Installing iperf3"
sudo apt remove iperf3 libiperf0
sudo apt install libsctp1
wget https://iperf.fr/download/ubuntu/libiperf0_3.7-3_amd64.deb
wget https://iperf.fr/download/ubuntu/iperf3_3.7-3_amd64.deb
sudo dpkg -i libiperf0_3.7-3_amd64.deb iperf3_3.7-3_amd64.deb
rm libiperf0_3.7-3_amd64.deb iperf3_3.7-3_amd64.deb
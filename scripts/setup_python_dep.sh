#!/bin/bash

# Install python3-dev
echo -e "\n\n#####################################"
echo -e "\n-Installing python3-dev"
apt-get install -y python3-dev &&

# Install graphviz
echo -e "\n\n#####################################"
echo -e "\n-Installing graphviz"
apt-get install -y graphviz &&

# Install libgraphviz-dev
echo -e "\n\n#####################################"
echo -e "\n-Installing libgraphviz-dev"
apt-get install -y libgraphviz-dev &&

# Install mininet
echo -e "\n\n#####################################"
echo -e "\n-Installing mininet"
apt-get install -y mininet &&
pip3 install git+https://github.com/mininet/mininet.git &&

# Install python3-pip
echo -e "\n\n#####################################"
echo -e "\n-Installing python3-pip"
apt install -y python3-pip &&

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

# Install protobuf
echo -e "\n\n#####################################"
echo -e "\n-Installing protobuf"
pip3 install protobuf &&

# Install pyaml
echo -e "\n\n#####################################"
echo -e "\n-Installing pyaml"
pip3 install pyaml &&

# Install pygraphviz
echo -e "\n\n#####################################"
echo -e "\n-Installing pygraphviz"
pip3 install pygraphviz &&

# Install pyroute2
echo -e "\n\n#####################################"
echo -e "\n-Installing pyroute2"
pip3 install pyroute2 &&

# Install six
echo -e "\n\n#####################################"
echo -e "\n-Installing six"
pip3 install six &&


# End of setup
echo -e "\n\n#####################################"
echo -e "\n-End of setup"

#!/bin/bash

# setup_frr.sh

WORKSPACE="$HOME/workspace"
ROSE_SYSTEM="$HOME/.rose"
ROSE_VM_SCRIPTS="$WORKSPACE/rose-vm/scripts"

GITHUB_NETGROUP="https://github.com/netgroup"
GITLAB_SRV6_PRIVATE="https://gitlab.com/srv6-private"

UPDATE_ALL_BODY="$ROSE_VM_SCRIPTS/update_all_body.sh"
GIT_REPOS_LIST="$ROSE_VM_SCRIPTS/git_repos_list.sh"

# possible values for FRRVER: frr-6 frr-7 frr-stable
# frr-stable will be the latest official stable release
FRRVER="frr-stable"

cd $WORKSPACE

# Install FRR
echo -e "\n\n#####################################"
echo -e "\n-Installing FRR"
# add GPG key
wget https://deb.frrouting.org/frr/keys.asc 
sudo apt-key add keys.asc
rm keys.asc
echo deb https://deb.frrouting.org/frr $(lsb_release -s -c) $FRRVER | sudo tee -a /etc/apt/sources.list.d/frr.list
# update and install FRR
sudo apt update && sudo apt -y install frr frr-pythontools

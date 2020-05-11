#!/bin/bash

# setup_frr.sh

HOME_DIR="$HOME"
WORKSPACE="$HOME_DIR/workspace"
ROSE_SYSTEM="$HOME_DIR/.rose"
ROSE_VM_SCRIPTS="$WORKSPACE/rose-vm/scripts"

GITHUB_NETGROUP="https://github.com/netgroup"
GITLAB_SRV6_PRIVATE="https://gitlab.com/srv6-private"

UPDATE_ALL_BODY="$ROSE_VM_SCRIPTS/update_all_body.sh"
GIT_REPOS_LIST="$ROSE_VM_SCRIPTS/git_repos_list.sh"

# possible values for FRRVER: frr-6 frr-7 frr-stable
# frr-stable will be the latest official stable release
FRRVER="frr-stable"

# NB: FRR is not yet released for "focal" release
#RELEASE=$(lsb_release -s -c)
RELEASE="bionic"

cd $HOME_DIR

# Install python2
echo -e "\n\n#####################################"
echo -e "\n-Installing python2"
sudo apt install -y python


# Install Mininet
echo -e "\n\n#####################################"
echo -e "\n-Installing Mininet"
sudo apt install -y mininet
sudo ln -s /usr/bin/xfce4-terminal /usr/bin/gnome-terminal


# Install FRR
echo -e "\n\n#####################################"
echo -e "\n-Installing FRR"

unzip "$WORKSPACE/rose-vm/compiled/frr-frr-7.3.1-compiled.zip"

cd frr-frr-7.3.1

sudo groupadd -r -g 92 frr
sudo groupadd -r -g 85 frrvty
sudo adduser --system --ingroup frr --home /var/run/frr/ \
   --gecos "FRR suite" --shell /sbin/nologin frr
sudo usermod -a -G frrvty frr

sudo make install

cd ..

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
sudo apt-get install -y python


# Install Mininet
echo -e "\n\n#####################################"
echo -e "\n-Installing Mininet"
sudo apt-get install -y mininet
if [[ -f "/usr/bin/gnome-terminal" ]]; then
    echo "/usr/bin/gnome-terminal already there"
else
    sudo ln -s /usr/bin/xfce4-terminal /usr/bin/gnome-terminal
fi

FRR_INSTALLED="no"
if [[ $(/usr/lib/frr/zebra -v) ]]; then
    FRR_INSTALLED="yes"
else
    if [[ -d "$HOME_DIR/frr-frr-7.3.1" ]]; then
        echo "Found directory $HOME_DIR/frr-frr-7.3.1 (now removing it)"
        sudo rm -rf "$HOME_DIR/frr-frr-7.3.1"
    else
        echo "directory $HOME_DIR/frr-frr-7.3.1 not found"
    fi
fi    

if [ FRR_INSTALLED == "no" ]; then

    # Install FRR
    echo -e "\n\n#####################################"
    echo -e "\n-Installing FRR"

    # # Install from package
    # # add GPG key
    # wget https://deb.frrouting.org/frr/keys.asc 
    # sudo apt-key add keys.asc
    # rm keys.asc
    # echo deb https://deb.frrouting.org/frr $RELEASE $FRRVER | sudo tee -a /etc/apt/sources.list.d/frr.list
    # # update and install FRR
    # sudo apt update && sudo apt -y install frr frr-pythontools

    # Install from source    
    wget https://github.com/FRRouting/frr/archive/frr-7.3.1.zip
    unzip frr-7.3.1.zip
    cd frr-frr-7.3.1
    sudo apt-get install -y dh-autoreconf
    ./bootstrap.sh

    sudo groupadd -r -g 92 frr
    sudo groupadd -r -g 85 frrvty
    sudo adduser --system --ingroup frr --home /var/run/frr/ \
       --gecos "FRR suite" --shell /sbin/nologin frr
    sudo usermod -a -G frrvty frr

    sudo apt-get install -y \
    git autoconf automake libtool make libreadline-dev texinfo \
    pkg-config libpam0g-dev libjson-c-dev bison flex python3-pytest \
    libc-ares-dev python3-dev libsystemd-dev python-ipaddress python3-sphinx \
    install-info build-essential libsystemd-dev libsnmp-dev perl libcap-dev

    sudo apt-get install -y libyang-dev

    ./configure \
        --prefix=/usr \
        --includedir=\${prefix}/include \
        --enable-exampledir=\${prefix}/share/doc/frr/examples \
        --bindir=\${prefix}/bin \
        --sbindir=\${prefix}/lib/frr \
        --libdir=\${prefix}/lib/frr \
        --libexecdir=\${prefix}/lib/frr \
        --localstatedir=/var/run/frr \
        --sysconfdir=/etc/frr \
        --with-moduledir=\${prefix}/lib/frr/modules \
        --with-libyang-pluginsdir=\${prefix}/lib/frr/libyang_plugins \
        --enable-configfile-mask=0640 \
        --enable-logfile-mask=0640 \
        --enable-snmp=agentx \
        --enable-multipath=64 \
        --enable-user=frr \
        --enable-group=frr \
        --enable-vty-group=frrvty \
        --with-pkg-git-version \
        --disable-ripd \
        --disable-ripngd \
        --disable-ospfd \
        --disable-ospf6d \
        --disable-bgpd \
        --disable-ldpd \
        --disable-nhrpd \
        --disable-eigrpd \
        --disable-babeld \
        --disable-watchfrr \
        --disable-pimd \
        --disable-vrrpd \
        --disable-pbrd \
        --disable-bgp-announce \
        --disable-bgp-vnc \
        --disable-bgp-bmp \
        --disable-ospfapi \
        --disable-ospfclient \
        --disable-fabricd \
        --disable-irdp \
        --enable-shell-access \
        --with-pkg-extra-version=-FRR_Rose
    make
    sudo make install

    cd ..
    rm frr-7.3.1.zip
else
    echo "FRR is already installed"
fi
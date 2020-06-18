#!/usr/bin/bash

# setup_srv6_tutorial.sh

echo -e "\n\n#####################################"
echo -e "\n-Installing SRv6 Tutorial dependencies"

# Paths
WORKSPACE="$HOME/workspace"
SRV6_TUTORIAL_REPO="$WORKSPACE/rose-srv6-tutorial"
SRV6_TUTORIAL_VENV_PATH="$HOME/.envs/mininet-venv"

# Activate the SRv6 Tutorial virtual environment
echo -e "\nActivating virtual environment"
source "$SRV6_TUTORIAL_VENV_PATH"/bin/activate

# Install dependencies
echo -e "\nInstalling rose-srv6-tutorial dependencies"
cd "$SRV6_TUTORIAL_REPO" || { echo "Failure"; exit 1; }
pip install -r requirements.txt

# Deactivate the SRv6 Tutorial virtual envrironment
echo -e "\nDeactivating virtual environment"
deactivate

# Create starter script for 3routers topology, if it does not exist
echo -e "\nCreating starter script for 3routers topology"
TOPO_STARTER_SH="$SRV6_TUTORIAL_REPO/nets/3routers/starter.sh"
if [ -f "$TOPO_STARTER_SH" ]; then
    echo -e "\n$TOPO_STARTER_SH already exists. Skipping."
else 
    echo -e "#!/usr/bin/bash\n\n" > "$TOPO_STARTER_SH"
    echo -e "# Activate the SRv6 Tutorial virtual environment" >> "$TOPO_STARTER_SH"
    echo -e "source $SRV6_TUTORIAL_VENV_PATH/bin/activate\n" >> "$TOPO_STARTER_SH"
    echo -e "# Start the Mininet emulation" >> "$TOPO_STARTER_SH"
    echo -e "python ospf3r.py" >> "$TOPO_STARTER_SH"
fi

# Create starter script for 8routers topology, if it does not exist
echo -e "\nCreating starter script for 8routers topology"
TOPO_STARTER_SH="$SRV6_TUTORIAL_REPO/nets/8routers/starter.sh"
if [ -f "$TOPO_STARTER_SH" ]; then
    echo -e "\n$TOPO_STARTER_SH already exists. Skipping."
else 
    echo -e "#!/usr/bin/bash\n\n" > "$TOPO_STARTER_SH"
    echo -e "# Activate the SRv6 Tutorial virtual environment" >> "$TOPO_STARTER_SH"
    echo -e "source $SRV6_TUTORIAL_VENV_PATH/bin/activate\n" >> "$TOPO_STARTER_SH"
    echo -e "# Start the Mininet emulation" >> "$TOPO_STARTER_SH"
    echo -e "python ospf8r.py" >> "$TOPO_STARTER_SH"
fi

# Create starter script for 8routers-isis-ipv6 topology, if it does not exist
echo -e "\nCreating starter script for 8routers-isis-ipv6 topology"
TOPO_STARTER_SH="$SRV6_TUTORIAL_REPO/nets/8routers-isis-ipv6/starter.sh"
if [ -f "$TOPO_STARTER_SH" ]; then
    echo -e "\n$TOPO_STARTER_SH already exists. Skipping."
else 
    echo -e "#!/usr/bin/bash\n\n" > "$TOPO_STARTER_SH"
    echo -e "# Activate the SRv6 Tutorial virtual environment" >> "$TOPO_STARTER_SH"
    echo -e "source $SRV6_TUTORIAL_VENV_PATH/bin/activate\n" >> "$TOPO_STARTER_SH"
    echo -e "# Start the Mininet emulation" >> "$TOPO_STARTER_SH"
    echo -e "python isis8d.py" >> "$TOPO_STARTER_SH"
fi

# Create starter script for 8r-1c-in-band-isis topology, if it does not exist
echo -e "\nCreating starter script for 8r-1c-in-band-isis topology"
TOPO_STARTER_SH="$SRV6_TUTORIAL_REPO/nets/8r-1c-in-band-isis/starter.sh"
if [ -f "$TOPO_STARTER_SH" ]; then
    echo -e "\n$TOPO_STARTER_SH already exists. Skipping."
else 
    echo -e "#!/usr/bin/bash\n\n" > "$TOPO_STARTER_SH"
    echo -e "# Activate the SRv6 Tutorial virtual environment" >> "$TOPO_STARTER_SH"
    echo -e "source $SRV6_TUTORIAL_VENV_PATH/bin/activate\n" >> "$TOPO_STARTER_SH"
    echo -e "# Start the Mininet emulation" >> "$TOPO_STARTER_SH"
    echo -e "python isis8d.py" >> "$TOPO_STARTER_SH"
fi

# Create starter script for 8r-1c-out-band-isis topology, if it does not exist
echo -e "\nCreating starter script for 8r-1c-out-band-isis topology"
TOPO_STARTER_SH="$SRV6_TUTORIAL_REPO/nets/8r-1c-out-band-isis/starter.sh"
if [ -f "$TOPO_STARTER_SH" ]; then
    echo -e "\n$TOPO_STARTER_SH already exists. Skipping."
else 
    echo -e "#!/usr/bin/bash\n\n" > "$TOPO_STARTER_SH"
    echo -e "# Activate the SRv6 Tutorial virtual environment" >> "$TOPO_STARTER_SH"
    echo -e "source $SRV6_TUTORIAL_VENV_PATH/bin/activate\n" >> "$TOPO_STARTER_SH"
    echo -e "# Start the Mininet emulation" >> "$TOPO_STARTER_SH"
    echo -e "python isis8d.py" >> "$TOPO_STARTER_SH"
fi

# Create starter script for 8r-1c-srv6-pm topology, if it does not exist
echo -e "\nCreating starter script for 8r-1c-srv6-pm topology"
TOPO_STARTER_SH="$SRV6_TUTORIAL_REPO/nets/8r-1c-srv6-pm/starter.sh"
if [ -f "$TOPO_STARTER_SH" ]; then
    echo -e "\n$TOPO_STARTER_SH already exists. Skipping."
else 
    echo -e "#!/usr/bin/bash\n\n" > "$TOPO_STARTER_SH"
    echo -e "# Activate the SRv6 Tutorial virtual environment" >> "$TOPO_STARTER_SH"
    echo -e "source $SRV6_TUTORIAL_VENV_PATH/bin/activate\n" >> "$TOPO_STARTER_SH"
    echo -e "# Start the Mininet emulation" >> "$TOPO_STARTER_SH"
    echo -e "python isis8d.py" >> "$TOPO_STARTER_SH"
fi

# End of setup
echo -e "\nDone"
echo -e "\n\n#####################################"
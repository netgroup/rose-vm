#!/usr/bin/bash

# setup_node_mgr.sh

echo -e "\n\n#####################################"
echo -e "\n-Installing node-manager modules"

# Paths
WORKSPACE="$HOME/workspace"
DATA_PLANE_REPO="$WORKSPACE/rose-srv6-data-plane"
CONTROL_PLANE_REPO="$WORKSPACE/rose-srv6-control-plane"
NODE_MGR_VENV_PATH="$HOME/.envs/node-mgr-venv"
PROTOS_PATH="$CONTROL_PLANE_REPO/control_plane/protos"
NODE_MGR_PATH="$CONTROL_PLANE_REPO/control_plane/node-manager"
NODE_MGR_STARTER_SH="$NODE_MGR_PATH/starter.sh"
NODE_MGR_ENV_FILE="$NODE_MGR_PATH/node_manager/config/node_manager.env"

# Install prerequisites
echo -e "\nInstalling libffi-dev"
sudo apt install -y libffi-dev

# Activate the node-manager virtual environment
echo -e "\nActivating virtual environment"
source "$NODE_MGR_VENV_PATH"/bin/activate

# Remove __pycache__, .pyc and .pyo files from the repository folder
echo -e "\nRemoving old __pycache__, .pyc and .pyo files"
cd "$DATA_PLANE_REPO" || {
    echo "Failure"
    exit 1
}
find . | grep -E "(__pycache__|\.pyc|\.pyo$)" | xargs sudo rm -rf
cd "$CONTROL_PLANE_REPO" || {
    echo "Failure"
    exit 1
}
find . | grep -E "(__pycache__|\.pyc|\.pyo$)" | xargs sudo rm -rf

#we need to install these beforehand, because some setup.py builds proto before
#installing the requirements :-(
pip install protobuf==3.19.6
pip install grpcio==1.41.1
pip install grpcio-tools==1.41.1


# Install prerequisites
echo -e "\nInstalling rose-srv6-data-plane modules"
cd "$DATA_PLANE_REPO" || {
    echo "Failure"
    exit 1
}
#python setup.py develop
pip install -e .

# Install protobuf modules in develop mode
echo -e "\nInstalling rose-srv6-control-plane/control_plane/protos modules"
cd "$PROTOS_PATH" || {
    echo "Failure"
    exit 1
}
#python setup.py develop
pip install -e .

# Install node-manager modules in develop mode
echo -e "\nInstalling rose-srv6-control-plane/control_plane/node-manager modules"
cd "$NODE_MGR_PATH" || {
    echo "Failure"
    exit 1
}
#python setup.py develop
pip install -e .

# Deactivate the node-manager virtual envrironment
echo -e "\nDeactivating virtual environment"
deactivate

# Create starter script for node-manager, if it does not exist
echo -e "\nCreating starter script"
if [ -f "$NODE_MGR_STARTER_SH" ]; then
    echo -e "\n$NODE_MGR_STARTER_SH already exists. Skipping."
else
    {
        echo -e "#!/usr/bin/bash\n\n" > "$NODE_MGR_STARTER_SH"
        echo -e "# Activate the node-manager virtual environment" >> "$NODE_MGR_STARTER_SH"
        echo -e "source $NODE_MGR_VENV_PATH/bin/activate\n" >> "$NODE_MGR_STARTER_SH"
        echo -e "# Start the node-manager" >> "$NODE_MGR_STARTER_SH"
        echo -e "node_manager --env-file $NODE_MGR_ENV_FILE" >> "$NODE_MGR_STARTER_SH"
    }
fi

# End of setup
echo -e "\nDone"
echo -e "\n\n#####################################"

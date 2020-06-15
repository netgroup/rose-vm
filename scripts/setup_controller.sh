#!/usr/bin/bash

# setup_controller.sh

echo -e "\n\n#####################################"
echo -e "\n-Installing controller modules"

# Paths
WORKSPACE="$HOME/workspace"
CONTROL_PLANE_REPO="$WORKSPACE/rose-srv6-control-plane"
CONTROLLER_VENV_PATH="$HOME/.envs/controller-venv"
DB_UPDATE_PATH="$CONTROL_PLANE_REPO/db_update"
PROTOS_PATH="$CONTROL_PLANE_REPO/control_plane/protos"
CONTROLLER_PATH="$CONTROL_PLANE_REPO/control_plane/controller"
CONTROLLER_STARTER_SH="$CONTROLLER_PATH/starter.sh"
CONTROLLER_ENV_FILE="$CONTROLLER_PATH/controller/config/controller.env"

# Activate the controller virtual environment
echo -e "\nActivating virtual environment"
source $CONTROLLER_VENV_PATH/bin/activate

# Install prerequisites
echo -e "\nInstalling graphviz and libgraphviz-dev"
sudo apt install -y graphviz libgraphviz-dev

# Install db_update library in develop mode
echo -e "\nInstalling rose-srv6-control-plane/db_update library"
cd $DB_UPDATE_PATH
python setup.py develop

# Install protobuf modules in develop mode
echo -e "\nInstalling rose-srv6-control-plane/control_plane/protos modules"
cd $PROTOS_PATH
python setup.py develop

# Install controller modules in develop mode
echo -e "\nInstalling rose-srv6-control-plane/control_plane/controller modules"
cd $CONTROLLER_PATH
python setup.py develop

# Deactivate the controller virtual envrironment
echo -e "\nDeactivating virtual environment"
deactivate

# Create starter script for controller, if it does not exist
echo -e "\nCreating starter script"
if [ -f "$CONTROLLER_STARTER_SH" ]; then
    echo -e "\n$CONTROLLER_STARTER_SH already exists. Skipping."
else 
    echo -e "#!/usr/bin/bash\n\n" > $CONTROLLER_STARTER_SH
    echo -e "# Activate the controller virtual environment" >> $CONTROLLER_STARTER_SH
    echo -e "source $CONTROLLER_VENV_PATH/bin/activate\n" >> $CONTROLLER_STARTER_SH
    echo -e "# Start the controller" >> $CONTROLLER_STARTER_SH
    echo -e "controller --env-file $CONTROLLER_ENV_FILE" >> $CONTROLLER_STARTER_SH
fi

# End of setup
echo -e "\nDone"
echo -e "\n\n#####################################"
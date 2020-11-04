#!/usr/bin/bash

# setup_srv6_apps.sh

echo -e "\n\n#####################################"
echo -e "\n-Installing SRv6 Applications modules"

# Paths
WORKSPACE="$HOME/workspace"
CONTROL_PLANE_REPO="$WORKSPACE/rose-srv6-control-plane"
SRV6_APPS_VENV_PATH="$HOME/.envs/srv6-apps-venv"
PROTOS_PATH="$CONTROL_PLANE_REPO/control_plane/nb_protos"
SRV6_APPS_PATH="$CONTROL_PLANE_REPO/control_plane/apps"
CLI_STARTER_SH="$SRV6_APPS_PATH/apps/cli/starter.sh"
CLI_ENV_FILE="$SRV6_APPS_PATH/apps/cli/config/cli.env"

# Activate the srv6 apps virtual environment
echo -e "\nActivating virtual environment"
source "$SRV6_APPS_VENV_PATH"/bin/activate

# Remove __pycache__, .pyc and .pyo files from the repository folder
echo -e "\nRemoving old __pycache__, .pyc and .pyo files"
cd "$CONTROL_PLANE_REPO" || { echo "Failure"; exit 1; }
find . | grep -E "(__pycache__|\.pyc|\.pyo$)" | xargs sudo rm -rf

# Install protobuf modules in develop mode
echo -e "\nInstalling rose-srv6-control-plane/control_plane/nb_protos modules"
cd "$PROTOS_PATH" || { echo "Failure"; exit 1; }
python setup.py develop

# Install srv6 apps modules in develop mode
echo -e "\nInstalling rose-srv6-control-plane/control_plane/apps modules"
cd "$SRV6_APPS_PATH" || { echo "Failure"; exit 1; }
python setup.py develop

# Deactivate the srv6 apps virtual envrironment
echo -e "\nDeactivating virtual environment"
deactivate

# Create starter script for controller CLI, if it does not exist
echo -e "\nCreating starter script"
if [ -f "$CLI_STARTER_SH" ]; then
    echo -e "\n$CLI_STARTER_SH already exists. Skipping."
else 
    echo -e "#!/usr/bin/bash\n\n" > "$CLI_STARTER_SH"
    echo -e "# Activate the SRv6 Apps virtual environment" >> "$CLI_STARTER_SH"
    echo -e "source $SRV6_APPS_VENV_PATH/bin/activate\n" >> "$CLI_STARTER_SH"
    echo -e "# Start the CLI" >> "$CLI_STARTER_SH"
    echo -e "python cli.py --env-file $CLI_ENV_FILE" >> "$CLI_STARTER_SH"
fi

# End of setup
echo -e "\nDone"
echo -e "\n\n#####################################"
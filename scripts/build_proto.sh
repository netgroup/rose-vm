WORKSPACE="$HOME/workspace"
SRV6_TUTORIAL_CONTROLLER="$WORKSPACE/rose-srv6-control-plane"
PROTO_FOLDER="$SRV6_TUTORIAL_CONTROLLER/srv6_controller/protos"

cd $PROTO_FOLDER

# Build proto files
echo -e "\n\n#####################################"
echo -e "\n-Building proto files"
# activate venv
source $HOME/.rose-venv/bin/activate
bash build.sh
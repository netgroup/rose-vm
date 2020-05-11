WORKSPACE="$HOME/workspace"
SRV6_TUTORIAL_CONTROLLER="$WORKSPACE/srv6-tutorial-controller"
PROTO_FOLDER="$SRV6_TUTORIAL_CONTROLLER/srv6_controller/protos"

cd $PROTO_FOLDER

# Build proto files
echo -e "\n\n#####################################"
echo -e "\n-Building proto files"
bash build.sh
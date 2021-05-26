#!/bin/bash

# cloud_native_srv6_pm.sh
# start docker infrastructure for Cloud Native SRv6-PM

WORKSPACE="$HOME/workspace"
ROSE_VM_SCRIPTS="$WORKSPACE/rose-vm/scripts"

printandexec () {
		echo "$@"
		eval "$@"
}


echo -e "\n\n#####################################"
echo -e "\n-Starting docker service"
sudo systemctl start docker

echo -e "\n\n#####################################"
echo -e "\n-Deploying docker stack"
printandexec "$ROSE_VM_SCRIPTS/build_deploy_docker_stack.sh"

echo ""
read -r -p "Press enter to exit" response

#!/bin/bash

# cloud_native_srv6_pm.sh
# start docker infrastructure for Cloud Native SRv6-PM

WORKSPACE="$HOME/workspace"
ROSE_SYSTEM="$HOME/.rose"
ROSE_VM_SCRIPTS="$WORKSPACE/rose-vm/scripts"

printandexec () {
		echo "$@"
		eval "$@"
}


sudo systemctl start docker

printandexec "$ROSE_VM_SCRIPTS/build_deploy_docker_stack.sh"

echo ""
read -r -p "Press enter to exit" response

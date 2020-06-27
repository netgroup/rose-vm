#!/bin/bash

# git_status_all.sh

WORKSPACE="$HOME/workspace"
#ROSE_SYSTEM="$HOME/.rose"
ROSE_VM_SCRIPTS="$WORKSPACE/rose-vm/scripts"

#GITHUB_NETGROUP="https://github.com/netgroup"

#UPDATE_ALL_BODY="$ROSE_VM_SCRIPTS/update_all_body.sh"
GIT_REPOS_LIST="$ROSE_VM_SCRIPTS/git_repos_list.sh"

i=0

#REPO_NAMES[$i]="rose-vm"
#GIT_BASE[$i]="$GITHUB_NETGROUP"
LOCAL_NAME[$i]="rose-vm"
LOCAL_PATH[$i]="$WORKSPACE"
i=$((i+1))

# shellcheck disable=SC1090
source "$GIT_REPOS_LIST"


END=$i

printandexec () {
		echo "$@"
		eval "$@"
}


for ((i=0;i<END;i++)); 

do
#	REPO_NAME="${REPO_NAMES[$i]}"
	REPO_DIR="${LOCAL_PATH[$i]}/${LOCAL_NAME[$i]}"
	if [ -d "$REPO_DIR" ]; then
		echo ""
  		# It will enter here if $REPO_dir exists.
  		echo ""
		printandexec cd "$REPO_DIR"
		printandexec git status
	else 
		echo ""
		echo "Directory $REPO_DIR is not present"
	fi

done

echo ""
read -r -p "Press enter to exit" response
echo "$response"


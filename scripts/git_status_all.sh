#!/bin/bash

# git_status_all.sh

#REPO_PATH=/home/user/workspace
WORKSPACE="$HOME/workspace"
ROSE_SYSTEM="$HOME/.rose"

GITHUB_NETGROUP="https://github.com/netgroup"
GITLAB_SRV6_PRIVATE="https://gitlab.com/srv6-private"

i=0

source "$WORKSPACE/rose-vm/scripts/git_repos_list.sh"

# REPO_NAMES[$i]="rose-vm-build"
# GIT_BASE[$i]="$GITHUB_NETGROUP"
# LOCAL_NAME[$i]="rose-vm-build"
# LOCAL_PATH[$i]="$ROSE_SYSTEM"
# i=$((i+1))

# REPO_NAMES[$i]="draft-srv6-tutorial"
# GIT_BASE[$i]="$GITHUB_NETGROUP"
# LOCAL_NAME[$i]="draft-srv6-tutorial"
# LOCAL_PATH[$i]="$WORKSPACE"
# i=$((i+1))

# REPO_NAMES[$i]="srv6-tutorial-controller"
# GIT_BASE[$i]="$GITHUB_NETGROUP"
# LOCAL_NAME[$i]="srv6-tutorial-controller"
# LOCAL_PATH[$i]="$WORKSPACE"
# i=$((i+1))


END=$i

printandexec () {
		echo "$@"
		eval "$@"
}


for ((i=0;i<END;i++)); 

do
	REPO_NAME="${REPO_NAMES[$i]}"
	REPO_DIR="${LOCAL_PATH[$i]}/${LOCAL_NAME[$i]}"
	if [ -d $REPO_DIR ]; then
		echo ""
  		# It will enter here if $REPO_dir exists.
  		echo ""
		printandexec cd $REPO_DIR
		printandexec git status
	else 
		echo ""
		echo "Directory $REPO_DIR is not present"
	fi

done

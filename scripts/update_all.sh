#!/bin/bash

# update_all.sh
# executes update for rose-vm, but does not clone
# then executes updates_all_body.sh

WORKSPACE="$HOME/workspace"
ROSE_SYSTEM="$HOME/.rose"
ROSE_VM_SCRIPTS="$WORKSPACE/rose-vm/scripts"

GITHUB_NETGROUP="https://github.com/netgroup"
GITLAB_SRV6_PRIVATE="https://gitlab.com/srv6-private"

UPDATE_ALL_BODY="$ROSE_VM_SCRIPTS/update_all_body.sh"
GIT_REPOS_LIST="$ROSE_VM_SCRIPTS/git_repos_list.sh"
SETUP_FRR="$ROSE_VM_SCRIPTS/setup_frr.sh"

i=0

REPO_NAMES[$i]="rose-vm"
GIT_BASE[$i]="$GITHUB_NETGROUP"
LOCAL_NAME[$i]="rose-vm"
LOCAL_PATH[$i]="$WORKSPACE"
i=$((i+1))

END=$i

printandexec () {
		echo "$@"
		eval "$@"
}

for ((i=0;i<END;i++)); 

do
	REPO_NAME="${REPO_NAMES[$i]}"
	REPO_DIR="${LOCAL_PATH[$i]}/$LOCAL_NAME"
	if [ -d "$REPO_DIR" ]; then
		echo ""
  		# It will enter here if $REPO_dir exists.
		printandexec cd "$REPO_DIR"

		if [ "$(git status | grep 'nothing to commit')" ]; then
			#echo "nothing to commit, working directory clean"
			git pull
		else
		#if [ ! "$(git status | grep 'nothing to commit, working directory clean')" ]; then
			printandexec git status
			echo ""
			echo "Your working directory $REPO_DIR has some changes."
			echo "What do you want to do:"
			echo "- Delete (stash) your changes and pull from git [d/D]"
			echo "- Do nothing (skip pull) [n/N]"
			echo "- Try to pull [Press any other key]"
			read -r -p "? " response
			if [[ $response =~ ^([dD])$ ]]; then
	    		printandexec git stash
	    		printandexec git pull
	    	else
				if [[ $response =~ ^([nN])$ ]]; then
					echo "skipped"
		    	else
		    		printandexec git pull
		    	fi
			fi
		fi	
	fi
done

#printandexec ./update_all_body.sh
printandexec "$UPDATE_ALL_BODY" "$1"
find "$ROSE_VM_SCRIPTS" -type f -exec chmod +x {} \;

printandexec "$SETUP_FRR"

printandexec "$ROSE_VM_SCRIPTS/setup_srv6_apps.sh"
printandexec "$ROSE_VM_SCRIPTS/setup_controller.sh"
printandexec "$ROSE_VM_SCRIPTS/setup_node_mgr.sh"
printandexec "$ROSE_VM_SCRIPTS/setup_srv6_tutorial.sh"
#printandexec "$ROSE_VM_SCRIPTS/build_deploy_docker_stack.sh"

echo ""
read -r -p "Press enter to exit" response

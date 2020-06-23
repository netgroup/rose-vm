#!/bin/bash

# update_all_body.sh

WORKSPACE="$HOME/workspace"
ROSE_SYSTEM="$HOME/.rose"
ROSE_VM_SCRIPTS="$WORKSPACE/rose-vm/scripts"

GITHUB_NETGROUP="https://github.com/netgroup"
GITLAB_SRV6_PRIVATE="https://gitlab.com/srv6-private"

UPDATE_ALL_BODY="$ROSE_VM_SCRIPTS/update_all_body.sh"
GIT_REPOS_LIST="$ROSE_VM_SCRIPTS/git_repos_list.sh"

i=0

# shellcheck disable=SC1091
source "$GIT_REPOS_LIST"

END=$i

printandexec () {
		echo "$@"
		eval "$@"
}


for ((i=0;i<END;i++)); 

do
	REPO_NAME="${REPO_NAMES[$i]}"
	REPO_DIR="${LOCAL_PATH[$i]}/${LOCAL_NAME[$i]}"
	if [ -d "$REPO_DIR" ]; then
		echo ""
  		# It will enter here if $REPO_dir exists.
		printandexec cd "$REPO_DIR"  || { echo "Failure"; exit 1; }

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
	else 
		echo ""
		echo "Directory $REPO_DIR is not present"
		if [ "$1" = "clone_repos" ];then
			cd "${LOCAL_PATH[$i]}"
				printandexec git clone "${GIT_BASE[$i]}/$REPO_NAME.git" "${LOCAL_NAME[$i]}"
		fi	

	fi

done

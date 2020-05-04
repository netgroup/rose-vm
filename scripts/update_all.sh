#!/bin/bash

# update_all.sh
# executes update for rose-vm, but does not clone
# then executes updates_all_body.sh

#REPO_PATH=/home/user/workspace
WORKSPACE="$HOME/workspace"
ROSE_SYSTEM="$HOME/.rose"

GITHUB_NETGROUP="https://github.com/netgroup"

UPDATE_ALL_BODY="./update_all_body.sh $1"


i=0

REPO_NAMES[$i]="rose-vm"
GIT_BASE[$i]="$GITHUB_NETGROUP"
TARGET_NAME[$i]="rose-vm-build"
TARGET_PATH[$i]="$ROSE_SYSTEM"
i=$((i+1))

END=$i

printandexec () {
		echo "$@"
		eval "$@"
}

for ((i=0;i<END;i++)); 

do
	REPO_NAME="${REPO_NAMES[$i]}"
	REPO_DIR="${TARGET_PATH[$i]}/$TARGET_NAME"
	if [ -d $REPO_DIR ]; then
		echo ""
  		# It will enter here if $REPO_dir exists.
		printandexec cd $REPO_DIR

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
done

#printandexec ./update_all_body.sh
printandexec $UPDATE_ALL_BODY
echo ""
read -r -p "Press enter to exit" response

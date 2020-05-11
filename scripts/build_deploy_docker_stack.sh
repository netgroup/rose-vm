#!/bin/bash

# setup_frr.sh

WORKSPACE="$HOME/Workspace"

FLASK_APP="$WORKSPACE/srv6-pm-flask"

DASHBOARD_REPO="$WORKSPACE/rose-dashboard"

DOCKERIZED_REPO="$WORKSPACE/srv6-pm-dockerized"

cd $FLASK_APP

docker build -t rose-expman:beta . --no-cache

cd $DASHBOARD_REPO

docker build -t rose-dashboard:beta . --no-cache

cd $DOCKERIZED_REPO
# init a swarm
case "$(docker info --format '{{.Swarm.LocalNodeState}}')" in
  inactive)
    docker swarm init;;
  pending)
    docker swarm init;;
  active)
    echo "Node is in a swarm cluster";;
  locked)
    echo "Node is in a locked swarm cluster";;
  error)
    echo "Node is in an error state";;
  *)
    echo "Unknown state $(docker info --format '{{.Swarm.LocalNodeState}}')";;
esac

echo "Deploy rose_stack"
docker stack rm rose_stack
sleep 10
docker stack deploy --compose-file docker-compose.yml  -c docker-compose.roseexpmanager.yml  -c docker-compose.arangodb.yml rose_stack
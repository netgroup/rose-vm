#!/bin/bash

WORKSPACE="$HOME/workspace"

DOCKERIZED_REPO="$WORKSPACE/rose-srv6-pm-dockerized"

cd "$DOCKERIZED_REPO" || {
  echo "Failure"
  exit 1
}
# init a swarm
case "$(docker info --format '{{.Swarm.LocalNodeState}}')" in
inactive)
  echo "Init Swarm"
  docker swarm init
  ;;
pending)
  echo "Init Swarm"
  docker swarm init
  ;;
active)
  echo "Node is in a swarm cluster"
  ;;
locked)
  echo "Node is in a locked swarm cluster"
  ;;
error)
  echo "Node is in an error state"
  echo "Leave the node"
  docker swarm leave --force
  echo "Init Swarm"
  docker swarm init
  ;;
*)
  echo "Unknown state $(docker info --format '{{.Swarm.LocalNodeState}}')"
  ;;

esac

echo "Deploy rose_stack"

docker stack rm rose_stack
sleep 10
docker stack deploy --compose-file docker-compose.yml -c docker-compose.roseexpmanager.yml -c docker-compose.arangodb.yml rose_stack

docker stack rm rose_stack
sudo systemctl stop docker
docker stack rm rose_stack
sudo ip link del docker_gwbridge


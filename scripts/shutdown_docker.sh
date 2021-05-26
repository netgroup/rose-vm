docker stack rm rose_stack
sudo systemctl stop docker
sudo ip link del docker0
sudo ip link del docker_gwbridge


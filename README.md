
# Docker Core

## Docker command
```bash
# Run a command in a running container
docker exec -it [container ID] bash

# Stop all container 
docker stop $(docker ps -aq)

# Remove all container
docker rm $(docker ps -aq)

# Remove all imgaes
docker rmi $(docker imgaes -aq)

# show list container
docker ps -a

# show list imgaes
docker imgaes
```
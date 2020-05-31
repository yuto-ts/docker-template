#!/bin/bash

# Purge Docker containers.
docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)

# Purge <none> images 
# docker rmi -f $(docker images -f "dangling=true" -q)

# Purge Docker images.
# docker rmi $(docker images -q)
# docker rmi -f  docker_reinforcement-learning:latest

# Build the Docker image.
docker-compose -f ./docker/docker-compose.yml build
# docker build . -t mnist
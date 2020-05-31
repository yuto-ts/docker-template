#!/bin/bash

# Run the Docker container.
docker-compose -f ./docker/docker-compose.yml up -d

# Give Docker access to X Server to display GUI.
xhost +

# Enter the Docker container.
docker exec -it docker_template-docker_1 /bin/bash
# docker run -it docker_template-docker_1:latest /bin/bash
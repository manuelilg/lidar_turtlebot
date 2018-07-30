#!/bin/bash

echo "Enter the Container ID (show all IDs with: docker ps -a):"
read container_id

sudo docker exec -it $container_id bash
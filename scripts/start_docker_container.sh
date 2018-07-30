#!/bin/bash

echo "Enter the Container ID (show all IDs with: docker ps -a):"
read container_id

sudo docker start -ia $container_id
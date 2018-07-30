#!/bin/bash

sudo docker run -it \
  -e "DISPLAY" \
  -e "QT_X11_NO_MITSHM=1" \
  -v="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
  -v /etc/localtime:/etc/localtime:ro \
  -v "/tmp/docker_share/lidar_turtlebot:/tmp/docker_share" \
  --privileged \
  -v /dev:/dev \
  --device=/dev/dri:/dev/dri
  --network host \
  manuelilg/lidar_turtlebot:latest

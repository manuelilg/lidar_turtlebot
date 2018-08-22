FROM manuelilg/cartographer_ros:kinetic-latest

RUN apt-get update && \
    apt-get install python-catkin-tools less nano bash-completion -y && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir -p catkin_ws/src && cd catkin_ws && catkin init
WORKDIR catkin_ws/src

# This file's content changes whenever master changes. See:
# http://stackoverflow.com/questions/36996046/how-to-prevent-dockerfile-caching-git-clone
ADD https://api.github.com/repos/manuelilg/lidar_turtlebot/git/refs/heads/master /tmp/git-json/lidar_turtlebot.json
RUN git clone https://github.com/manuelilg/lidar_turtlebot.git

ADD https://api.github.com/repos/manuelilg/velodyne/git/refs/heads/master /tmp/git-json/velodyne.json
RUN git clone -b master --single-branch https://github.com/manuelilg/velodyne.git

WORKDIR ../
RUN apt-get update && \
    rosdep update && \
    rosdep install -n --from-paths src --ignore-src -y && \
    . /opt/cartographer_ros/setup.sh && \
    catkin build && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /

COPY ./scripts/ros_entrypoint.sh /


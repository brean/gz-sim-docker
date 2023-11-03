#!/bin/bash
echo "Start Gazebo Simulation!"
xhost +local:root
docker run -e DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix:rw --privileged brean/gz_sim:garden-humble
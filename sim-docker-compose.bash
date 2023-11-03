#!/bin/bash
echo "Start Gazebo Simulation!"
xhost +local:root
docker compose run gz_sim gz sim
# gz-sim-docker
Base docker container for Gazebo on top of ROS using NVIDIA runtime.

## Usage
You can build your own Docker container using:
```Dockerfile
FROM brean/gz_sim_harmonic:humble
```
to build your docker environment.

To test can easily run it like this:
```bash
xhost +local:root
docker compose run gz_sim
```
(see "./sim-docker-compose.bash")

or if you don't have a configured docker-compose.yml file
```bash
xhost +local:root
docker run -e DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix:rw --privileged brean/gz_sim:harmonic-humble
```
(see "./sim-docker.bash")

## rebuilding
To rebuild the docker container call `docker compose build` in this directory, 
although that is NOT necessary, you can just call `docker compose pull`
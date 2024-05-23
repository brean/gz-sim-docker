ARG ROS_DISTRO
FROM ros:${ROS_DISTRO}

ENV COLCON_WS=/root/colcon_ws
ENV COLCON_WS_SRC=/root/colcon_ws/src
ENV PYTHONWARNINGS="ignore:setup.py install is deprecated::setuptools.command.install"

ENV DEBIAN_FRONTEND noninteractive

# see https://gazebosim.org/docs/harmonic/install_ubuntu
ARG GZ_VERSION

RUN apt-get update -qq \
    && apt-get install -y \
        wget \
    && rm -rf /var/lib/apt/lists/*

RUN wget https://packages.osrfoundation.org/gazebo.gpg -O /usr/share/keyrings/pkgs-osrf-archive-keyring.gpg\
    && echo "deb [arch=amd64 signed-by=/usr/share/keyrings/pkgs-osrf-archive-keyring.gpg] http://packages.osrfoundation.org/gazebo/ubuntu-stable `lsb_release -cs` main" | sudo tee /etc/apt/sources.list.d/gazebo-stable.list > /dev/null

RUN apt-get update -qq \
    && apt-get install -y \
        gz-${GZ_VERSION} \
        build-essential\
        ros-${ROS_DISTRO}-rcl-interfaces\
        ros-${ROS_DISTRO}-rclcpp\
        ros-${ROS_DISTRO}-builtin-interfaces\
        ros-${ROS_DISTRO}-ros-gz\
        ros-${ROS_DISTRO}-sdformat-urdf\
        ros-${ROS_DISTRO}-vision-msgs\
        ros-${ROS_DISTRO}-actuator-msgs\
        ros-${ROS_DISTRO}-image-transport\
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p ${COLCON_WS_SRC}\
    && cd ${COLCON_WS}\
    && . /opt/ros/${ROS_DISTRO}/setup.sh\
    && colcon build

CMD gz sim
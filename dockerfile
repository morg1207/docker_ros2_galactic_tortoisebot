# Start from ROS base image
FROM ros:galactic-ros-base

# Install dependencies
RUN apt-get update 
RUN apt-get install -y git \
	ros-galactic-joint-state-publisher \
    ros-galactic-robot-state-publisher \
    ros-galactic-teleop-twist-keyboard \
	ros-galactic-teleop-twist-joy \
    ros-galactic-xacro \
	ros-galactic-urdf  \
    ros-galactic-rviz2

RUN apt-get install -y ros-galactic-rviz2-* \
    ros-galactic-image-transport-plugins 



# Source the workspace every time a new shell is opened in the containe
COPY entrypoint.sh /

COPY scripts/camera.py /scripts/
#RUN mkdir  /rviz

#RUN touch map_config.rviz
#COPY rviz/map_config.rviz /rviz
RUN chmod +x /entrypoint.sh

RUN apt-get update && apt-get install -y expect
RUN apt-get update && apt-get install -y xterm

COPY teleop_twist_keyboard_expect.sh /teleop_twist_keyboard_expect.sh
RUN chmod +x teleop_twist_keyboard_expect.sh

# Configurar punto de entrada
ENTRYPOINT ["/entrypoint.sh"]
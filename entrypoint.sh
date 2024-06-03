#!/bin/bash
set -e

# Source the ROS 2 Galactic setup script
source /opt/ros/galactic/setup.bash

# Ejecuta un bucle infinito para mantener el contenedor en funcionamiento
ros2 run rviz2 rviz2 -d /rviz/map_config.rviz &
python3 /scripts/camera.py &

# Ejecutar teleop_twist_keyboard con una terminal interactiva usando expect

exec xterm -e "ros2 run teleop_twist_keyboard teleop_twist_keyboard"

exec "$@"


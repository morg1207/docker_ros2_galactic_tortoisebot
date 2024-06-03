#!/usr/bin/expect -f

set timeout -1

# Ejecutar teleop_twist_keyboard con una terminal interactiva
spawn ros2 run teleop_twist_keyboard teleop_twist_keyboard
interact
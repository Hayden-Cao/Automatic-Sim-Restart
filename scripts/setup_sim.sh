#!/bin/bash

. ~/rocker_venv/bin/activate
rocker --nvidia --x11 --volume .:/sim_ws/src/f1tenth_gym_ros --volume /mnt/c/Users/caoha/f1tenth_gym_ros/scripts:/sim_ws --volume /mnt/c/Users/caoha/f1tenth_gym_ros/nodes:/sim_ws/src/nodes -- f1tenth_gym_ros
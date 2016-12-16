#!/bin/bash

# Allows an easy addition of new tabs to a terminal window, while also keeping the current ROS
# parameters (rosuri, rosip, sources, etc).
#
# Author: Thomas Colestock

echo "Creating new tab with current ROS_MASTER_URI and ROS_IP values..."
echo "How many new tabs would you like?"
read number

master="$(echo $ROS_MASTER_URI)"
ip="$(echo $ROS_IP)"
env_param="export ROS_MASTER_URI=$master; export ROS_IP=$ip"

for i in `seq 1 $number`;
do
  xdotool key ctrl+shift+t
  sleep 1
  xdotool type --delay 1 --clearmodifiers "$env_param"
  xdotool key Return;
done

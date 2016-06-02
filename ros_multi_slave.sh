#!/bin/bash

# User can redefine source location of the multimaster_fkie directory:
sources="source ~/workspace/devel/setup.bash"

echo -e "This script starts Terminal tabs enabling multi-Master or multi-Machine (single master) ROS communication. \n"

echo "Does this setup include multiple MASTERS? (y/n)"
read multimast

echo "Enter the IP address of the ROS core (xxx.xxx.x.x):"
read master

echo "Enter IP address of this computer (xxx.xxx.x.x):"
read ip

if [[ "$multimast" == "y" ]]; then

  echo "Is this device the Gateway (leave blank if no gateway)? (y/n)"
  read is_gateway
  #is_gateway="$is_gateway_input"
  if [[ "$is_gateway" == "y" ]]; then
    echo "Enabling IP Forwarding..."
    sudo sh -c "echo 1 >/proc/sys/net/ipv4/ip_forward"
  elif [[ "$is_gateway" == "n" ]]; then
    echo "Specify IP Address of Gateway (xxx.xxx.x.x):"
    read gateway_ip
    sh -c "route add default gw $gateway_ip"
  fi

  echo "Enter the mcast group address (ex: 224.0.0.1):"
  read mcast_input
  echo "Testing if multicast is allowed..."
  mcast_output="$(cat /proc/sys/net/ipv4/icmp_echo_ignore_broadcasts)"
  echo $mcast_output
  if [[ $mcast_output -eq 1 ]]; then
    echo "multicast is not enabled, enabling multicast..."
    sudo sh -c "echo 0 >/proc/sys/net/ipv4/icmp_echo_ignore_broadcasts"
    mcast_output="$(cat /proc/sys/net/ipv4/icmp_echo_ignore_broadcasts)"
    echo $mcast_output
  fi

fi

env_param="export ROS_MASTER_URI=http://$master:11311; export ROS_IP=$ip"

if [[ "$multimast" == "y" ]]; then

  xdotool key ctrl+shift+t
  sleep 1
  xdotool type --delay 1 --clearmodifiers "$env_param; $sources; rosrun master_discovery_fkie master_discovery _mcast_group:=$mcast_input"
  xdotool key Return;


  xdotool key ctrl+shift+t
  sleep 1
  xdotool type --delay 1 --clearmodifiers "$env_param; $sources; rosservice call /master_discovery/list_masters"
  xdotool key Return;

else
  xdotool key ctrl+shift+t
  sleep 1
  xdotool type --delay 1 --clearmodifiers "$env_param"
  xdotool key Return;

fi


# xdotool key ctrl+shift+t
# sleep 1
# xdotool type --delay 1 --clearmodifiers "$env_param; $sources"
# xdotool key Return;
#
# xdotool key ctrl+shift+t
# sleep 1
# xdotool type --delay 1 --clearmodifiers "$env_param; $sources"
# xdotool key Return;


#export ROS_IP="192.168.0.2"
#export ROS_MASTER_URI="http://192.168.0.3:11311"

#!/bin/bash

# Delete  IP route interfaces interactively
# Follow this pattern:
# sudo ip -4 ro del <IP Address> dev <Interface>
# <IP Address> is the address communicating TO
# <Interface> is the port on this computer the communication should go through
#
# Author: Thomas Colestock

echo "The current current IP Route configuration is:"
ip route show

echo "Would you like to delete another route? (y/n)"
read flag

while [[ "$flag" == "y" ]]; do
  echo "Specify the IP address to delete: (xxx.xxx.x.x)"
  read ip
  echo "Specify device interface (ex: eth0, wlan0, etc):"
  read device
  sudo ip -4 ro del $ip dev $device
  echo "Would you like to add another route? (y/n)"
  read flag
  changed=1
done

if [[ $changed -eq 1 ]]; then
  echo -e "\nYour new Route Configuration is:\n"
  ip route show
fi

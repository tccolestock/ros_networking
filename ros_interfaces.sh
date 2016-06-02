#!/bin/bash

# Add and set up preconfigured IP route interfaces for proper communications
# Follow this pattern:
# sudo ip -4 ro add <IP Address> dev <Interface>
# <IP Address> is the address communicating TO
# <Interface> is the port on this computer the communication should go through

# eth0 interfaces--------------------------------------------------------------------
sudo ip -4 ro add 192.168.0.1 dev eth0  # laptop for EEG recording


# eth1 interfaces--------------------------------------------------------------------
sudo ip -4 ro add 192.168.0.3 dev eth1  # johnny's computer
sudo ip -4 ro add 192.168.0.4 dev eth1  # shadow computer
sudo ip -4 ro add 192.168.0.5 dev eth1  # moaed's computer


# eth2 interfaces--------------------------------------------------------------------
#sudo ip -4 ro add <address> dev eth2


# wlan0 interfaces--------------------------------------------------------------------
#sudo ip -4 ro add <address> dev wlan0

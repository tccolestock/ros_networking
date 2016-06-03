# ROS Networking

This repo is intended to streamline the networking setup process for:
* ROS Networks with a single Core (master) but multiple (slave) computers.
* ROS Networks with multiple Cores (masters) sharing a common network with potentially local (slave) computers.

## Required packages:
In order for multi-master systems and the bash scripts to work some packages are needed.
### xdotool
To enable the bash script networking to work xdotool was used. This allows for key strokes to be executed in the terminal as if they were physically executed.

#### Installation
Can be installed on systems running Ubuntu with:
```bash
sudo apt-get install xdotool
```
#### More Information
More information can be found in these links:
* [Xdotool website](http://www.semicomplete.com/projects/xdotool/ "Xdotool Website")
* [Xdotool github repository](https://github.com/jordansissel/xdotool "Xdotool Github")

### multimaster_fkie
The multimaster_fkie package allows for communication between multiple ROS Cores through a shared common network.

The Github Repository: [multimaster_fkie](https://github.com/fkie/multimaster_fkie "multimaster_fkie Github Repo")

#### Installation
An assumption that you have already created and initialized a catkin workspace directory for ROS is being made. If not, see [here](http://wiki.ros.org/catkin/Tutorials "ROS Catkin Tutorials").

1. Navigate to your ROS workspace directory src folder
    ```bash
    cd ~/workspace/src
    ```

2. Clone the github repository
    ```bash
    git clone https://github.com/fkie/multimaster_fkie
    ```

3. Catkin_make the workspace with the new package
    ```bash
    cd ~/workspace
    catkin_make
    ```

#### More Information
* [multimaster_fkie Github](https://github.com/fkie/multimaster_fkie "multimaster_fkie github")
* [multimaster_fkie github.io](http://fkie.github.io/multimaster_fkie/)
* [multimaster_fkie ROS wiki](http://wiki.ros.org/multimaster_fkie?distro=indigo "ROS Wiki")
* [multimaster_fkie technical report](http://wiki.ros.org/multimaster_fkie?distro=indigo "PDF Report and Walkthrough")


## How to Use
There are 5 interactive scripts.

1. ros_multi_master.sh
2. ros_multi_slave.sh
3. interfaces_add.sh
4. interfaces_del.sh
5. ros_new_tab.sh

Make sure each script is set to be executable, and navigate the terminal to their directory.

```bash
cd ~/path/to/ros_networking/ # navigate to the directory
chmod +x filename.sh # only needs to be done once
./file_to_run.sh # run the desired script
```

### Network Connection:

Two scripts are provided to allow for the establishment of the networking environment. Both can be used for multi-machine setups with a single Core, or with multi-master setups. Just specify (y/n) when prompted if the setup has multiple masters.

1. ros_multi_master.sh
  * Allows for the establishment of a ROS Core (master)
  * Will ask for the ROS_MASTER_URI (core/master's) IP Address.
  * Specify the IP Address of the gateway. If this computer is the gateway it will enable port forwarding.
  * Specify the mcast group (typically 224.0.0.1), and will enable multicasting.
  * Launches master_discovery, master_sync, and shows all masters on the network.

2. ros_multi_slave.sh
  * Allows for the setup of slave computers within the local subnets.
  * Will ask for ROS_MASTER_URI IP Address of the core, and the ROS_IP of the current computer.
  * Specify the IP Address of the gateway. If this computer is the gateway it will enable port forwarding.
  * Specify the mcast group (typically 224.0.0.1), and will enable multicasting.
  * Launches master_discovery, and shows all masters on the network (not necessary, but nice to know).

### Interface Control:

Three scipts are provided to allow for easier networking interface control. Two are interactive and allow for the addition or deletion of ip routes through specific interfaces. The third is more of an outline for setting up custom routes that are used continually. A separate copy of the ros_interfaces.sh script should be kept in another directory so future git pulls don't override it.

1. interfaces_add.sh
  * Creates and interactive prompt allowing you to dictate which device interface (eth# wlan#) communication to certain IP addresses is routed through.
  * Specify the IP Address of the device you are communicating to.
  * Specify which hardware interface the communication should be sent through.

2. interfaces_del.sh
* Creates and interactive prompt allowing you to delete device interface (eth# wlan#) communication.
* Specify the IP Address of the device you no longer with to communicate to.
* Specify which hardware interface the communication was being sent through.

3. ros_interfaces.sh
  * A customizable script that can be run to establish interface control. Useful if the same setup is required repeatedly. Recommended to save a backup copy in a different directory.

### Additional:

Although the other networking scripts allow easy initial setup, all new terminal windows and/or tabs also require the environmental parameters to be set. This can be annoying to do. This script is designed to make the creation of new tabs easier.

1. ros_new_tab.sh
  * Creates a user specified amount of new terminal tabs carrying over the environmental ROS_MASTER_URI and ROS_IP parameters.
  * Simply specify the number of new tabs you would like. 

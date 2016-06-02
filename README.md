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

Make sure each script is set to be executable, and navigate the terminal to their directory.

### Network Connection:
1. ros_multi_master.sh
  * Allows for the establishment of a ROS Core (master)
2. ros_multi_slave.sh
  * Allows for the setup of slave computers within the local subnets.

### Interface Control:
1. interfaces_add.sh
  * Dictate which device interface (eth# wlan#) communication to certain IP addresses is routed through.
2. interfaces_del.sh
3. ros_interfaces.sh
  * A customizable script that can be run to establish interface control. Useful if the same setup is required repeatedly.

### Additional:
1. ros_new_tab.sh
  * Creates a user specified amount of new terminal tabs carrying over the environmental ROS_MASTER_URI and ROS_IP parameters.

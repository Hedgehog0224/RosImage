source /opt/ros/$ROS_DISTRO/setup.bash
source $PROJECT_DIR/devel/setup.bash
export ROS_IP=$(hostname -i)

cd /root/ && rm -r catkin_ws && git clone https://github.com/Hedgehog0224/catkin_ws.git
rm -r /root/catkin_ws/build
rm -r /root/catkin_ws/devel
catkin_make

source /root/catkin_ws/devel/setup.bash

cd /root/catkin_ws/scr/ && rosnode list

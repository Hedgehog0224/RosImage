source /opt/ros/$ROS_DISTRO/setup.bash
source $PROJECT_DIR/devel/setup.bash
export ROS_IP=$(hostname -i)

cd /root/ && git clone https://github.com/Hedgehog0224/catkin_ws.git && cd -
cd /root/catkin_ws/ && catkin_make && cd -

source /root/catkin_ws/devel/setup.bash

cd /root/catkin_ws/scr/ && rosnode list

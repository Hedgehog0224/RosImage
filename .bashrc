source /opt/ros/$ROS_DISTRO/setup.bash
source $PROJECT_DIR/devel/setup.bash
export ROS_IP=$(hostname -i)
cd ~/catkin_ws && catkin_make ; cd - 
source /root/catkin_ws/devel/setup.bash

# cd ~/catkin_ws_joy && catkin_make ; cd - 
# source /root/catkin_ws_joy/devel/setup.bash

# cd ~/catkin_ws/scr/
# git clone https://github.com/Hedgehog0224/scripts.git
# cd -

roscore &
rosrun rplidar_ros rplidarNode &
rosrun joy joy_node &

cd ~/catkin_ws/scr/
rosnode list

FROM ubuntu:20.04

ARG hostname
ARG host_ip
ARG ros_master_uri
RUN apt update

ENV TZ=Europe/Kiev
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN sh -c 'echo "deb http://packages.ros.org/ros/ubuntu focal main" > /etc/apt/sources.list.d/ros-latest.list'
RUN apt install -y curl gnupg gnupg2 gnupg1
RUN curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | apt-key add -
RUN apt update && apt install -y ros-noetic-ros-base
ENV ROS_DISTRO noetic

RUN apt install -y python3-rosdep python3-rosinstall python3-rosinstall-generator python3-wstool build-essential
RUN apt install -y nano
RUN apt install -y python3-pip
RUN apt-get install -y qt5-default

RUN python3 -m pip install evdev
RUN python3 -m pip install RPi.GPIO
RUN python3 -m pip install pyserial
RUN python3 -m pip install board
RUN pip3 install adafruit-circuitpython-pca9685

RUN apt install -y ros-noetic-joy
RUN apt install -y ros-noetic-rplidar-ros

COPY .bashrc /root/

RUN mkdir /root/catkin_ws
ENV PROJECT_DIR=/root/catkin_ws
# ENV PROJECT_DIR=/root/catkin_ws_joy

ENV ROS_MASTER_URI=${ros_master_uri}

WORKDIR /root/catkin_ws/src
# RUN git clone https://github.com/Slamtec/rplidar_ros.git
# RUN git clone https://github.com/Hedgehog0224/scripts.git

# WORKDIR /root/catkin_ws_joy/src
# RUN git clone https://github.com/ros-drivers/joystick_drivers.git
# RUN git clone https://github.com/Hedgehog0224/scripts.git

WORKDIR ~/
COPY . .

WORKDIR /root/catkin_ws

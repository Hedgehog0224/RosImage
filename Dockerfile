FROM utrarobosoccer/noetic:latest

RUN apt update

RUN apt install -y python3-rosdep python3-rosinstall python3-rosinstall-generator python3-wstool build-essential
RUN apt install -y nano
RUN apt install -y git
RUN apt install -y python3-pip
RUN python3 -m pip install evdev
RUN python3 -m pip install RPi.GPIO
RUN python3 -m pip install pyserial
RUN python3 -m pip install board
RUN pip3 install adafruit-circuitpython-pca9685
RUN apt install -y ros-noetic-joy
RUN apt install -y ros-noetic-rplidar-ros

COPY .bashrc /root/
WORKDIR /root/catkin_ws

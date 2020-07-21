FROM ubuntu:20.04

RUN apt-get -y update && \
    apt-get -y install android-tools-fastboot android-tools-adb bash

VOLUME [ "/dev/bus/usb", "/fastboot" ]
WORKDIR /fastboot



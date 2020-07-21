FROM ubuntu:18.04

RUN apt-get -y update \
    && apt-get -y install \
		android-tools-fastboot \
		android-tools-adb \
		bash \
		usbutils \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*


VOLUME [ "/dev/bus/usb", "/fastboot" ]
WORKDIR /fastboot



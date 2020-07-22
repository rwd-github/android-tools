FROM ubuntu:20.04

RUN apt-get -y update && apt-get upgrade -y \
    && apt-get -y install \
		unzip \
		bash \
		usbutils \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*


ADD https://dl.google.com/android/repository/platform-tools-latest-linux.zip /tmp/platform-tools-latest-linux.zip
RUN mkdir -p /root/adb-fastboot \
	&& cd /root/adb-fastboot \
	&& unzip /tmp/platform-tools-latest-linux.zip

ADD bash_rc /root/bash_rc_add
RUN cat /root/bash_rc_add >> /root/.bashrc

VOLUME [ "/dev/bus/usb", "/fastboot" ]
WORKDIR /fastboot



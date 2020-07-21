FROM ubuntu:18.04

RUN apt-get -y update \
    && apt-get -y install \
		unzip \
		bash \
		usbutils \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*


ADD https://dl.google.com/android/repository/platform-tools-latest-linux.zip /tmp/platform-tools-latest-linux.zip
ADD bash_profile /root/.bash_profile
RUN mkdir -p /root/adb-fastboot \
	&& cd /root/adb-fastboot \
	&& unzip /tmp/platform-tools-latest-linux.zip

VOLUME [ "/dev/bus/usb", "/fastboot" ]
WORKDIR /fastboot



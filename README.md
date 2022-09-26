# Asterisk + chan_dongle

[![Build and push](https://github.com/dec0dos/asterisk-docker/actions/workflows/build_and_push.yml/badge.svg)](https://github.com/dec0dos/asterisk-docker/actions/workflows/build_and_push.yml)

This repository contains docker configuration and provides images for [Asterisk](https://www.asterisk.org/) with [chan_dongle](https://github.com/wdoekes/asterisk-chan-dongle).

Docker repository: [dec0dos/asterisk-rpi](https://hub.docker.com/r/dec0dos/asterisk-rpi)

GitHub repository: [dec0dos/asterisk-docker](https://github.com/dec0dos/asterisk-docker/)

# Basic usage

## Using images from hub.docker.com

Dockerhub contains docker images with compiled binaries for the following platforms: amd64, arm64, armv7.

To start container run the following command:

```sh
docker run -dit --name asterisk --volume /etc/asterisk:/etc/asterisk --network host --device /dev/ttyUSB0:/dev/ttyUSB0 --device /dev/ttyUSB1:/dev/ttyUSB1 --device /dev/ttyUSB2:/dev/ttyUSB2 --device /dev/ttyUSB3:/dev/ttyUSB3 --device /dev/ttyUSB4:/dev/ttyUSB4 --restart unless-stopped dec0dos/asterisk-rpi:latest
```

where:

- `/etc/asterisk` is a directory with asterisk configuration.
- `--device /dev/ttyUSBX:/dev/ttyUSBX` is a path to the USB devices of Huawei UMTS card

## Build yourself

To build the image locally run:

```sh
docker build -t asterisk https://raw.githubusercontent.com/dec0dos/asterisk-docker/master/Dockerfile
```

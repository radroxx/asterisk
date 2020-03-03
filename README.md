# asterisk
Asterisk + chan_dongle in docker.

**Usage example**
  * Build docker image.
    ```sh
    docker build -t asterisk https://raw.githubusercontent.com/dec0dOS/asterisk/master/Dockerfile
    ```
  * Create and run persistent container
    ```sh
    docker run --name asterisk-cont --network host --privileged -v /dev:/dev -v /etc/asterisk:/etc/asterisk -dit --restart unless-stopped asterisk
    ```



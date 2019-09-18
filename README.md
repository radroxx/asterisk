# asterisk
Asterisk + chan_dongle in docker.

**Usage example**
  * Clone the repository.
  * Build docker image.
    ```sh
    docker build -t asterisk .
    ```
  * Create and run persistent container
    ```sh
    docker run --name asterisk-cont --network host --privileged -v /dev:/dev -v /etc/asterisk:/etc/asterisk -dit --restart unless-stopped asterisk
    ```



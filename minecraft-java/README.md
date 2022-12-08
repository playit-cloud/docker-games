# Minecraft Java Server Docker Image

This directory contains a Dockerfile for building a Docker image that can be used to run a **Minecraft Java** server using the [`itzg/minecraft-server`](https://hub.docker.com/r/itzg/minecraft-server) image and the `playit-cli` tool.\
The image includes all the necessary dependencies and the `playit-cli` tool.

## Preparation

To use this Dockerfile, you need to have the following installed on your system:

Docker: This is required to build and run the Docker image. You can install Docker on your system by following the instructions on the [Docker website](https://docs.docker.com/get-docker/).

### Building the Docker Image

To build the Docker image, follow these steps:
1. Download the latest [Release](https://github.com/playit-cloud/docker-games/releases/latest)
2. Change to the directory containing the Dockerfile:
```cd
cd minecraft-java
```
3. Build the Docker image:
```
docker build -t minecraft-java .
```
This will create a Docker image named `minecraft-java` that contains all the dependencies and the `playit-cli` tool needed to run a Minecraft Java server using the `itzg/minecraft-server` image.

### Running the Minecraft Server
To run the Minecraft server, use the following command:

```docker
docker run -d -p 25565:25565 --name mc minecraft-server
```
This will start a new Docker container named `mc` using the `minecraft-java` image and start the Minecraft server using the `playit-cli` tool.

To stop the Minecraft server and the Docker container, use the following command:
```docker
docker stop mc
```
This will stop the Docker container and the Minecraft server.

> **Warning**\
> Please note that the exact command to start the Minecraft server using playit-cli may vary depending on the version of the tool and the options you want to use. You can use the `playit-cli --help` command to see the available options and usage instructions.

## Conclusion

In this guide, we showed how to use the Dockerfile in this repository to build a Docker image for a Minecraft Java server using the `itzg/minecraft-server` image and the `playit-cli` tool, and how to use the image to run and stop the Minecraft server.\
The `playit-cli` tool makes it easy to manage the Minecraft server inside the Docker container.
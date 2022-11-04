FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN dpkg --add-architecture i386 \
  && apt-get update \
  && apt-get upgrade -y

RUN apt-get install -y \
  tar curl gcc g++ lib32gcc-s1 libgcc1 libcurl4-gnutls-dev:i386 \
  libssl1.1:i386 libcurl4:i386 lib32tinfo6 libtinfo6:i386 lib32z1 \
  lib32stdc++6 libncurses5:i386 libcurl3-gnutls:i386 libsdl2-2.0-0:i386 \
  iproute2 gdb libsdl1.2debian libfontconfig1 telnet net-tools netcat \
  tzdata jq wget unzip


# add user "server" with sudo

RUN apt-get install -y sudo lib32gcc1

RUN useradd server -s /bin/bash -G sudo \
    && mkdir /home/server \
    && chown server -R /home/server

RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

USER server
WORKDIR /home/server

# download playit-cli

ENV PLAYIT_DL="https://github.com/playit-cloud/playit-agent/releases/download/v1.0.0-rc2/playit-cli-patch"

RUN curl -o playit-cli -L "$PLAYIT_DL"
RUN chmod +x playit-cli

# prepare entrypoint.sh

COPY entrypoint.sh run-base.sh ./
RUN sudo chmod +x entrypoint.sh

VOLUME /mnt/server

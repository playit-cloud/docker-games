# Use the itzg/docker-bungeecord image as the base for the new image
FROM itzg/docker-bungeecord

# Install the dependencies for the playit-cli tool
RUN apt-get update && apt-get install -y \
  tar curl gcc g++ lib32gcc1 libgcc1 libcurl4-gnutls-dev:i386 \
  libssl1.1:i386 libcurl4:i386 lib32tinfo6 libtinfo6:i386 lib32z1 \
  lib32stdc++6 libncurses5:i386 libcurl3-gnutls:i386 libsdl2-2.0-0:i386 \
  iproute2 gdb libsdl1.2debian libfontconfig1 telnet net-tools netcat \
  tzdata jq wget unzip

# Download the latest version of the playit-cli tool
ENV PLAYIT_DL="https://github.com/playit-cloud/playit-agent/releases/latest"
RUN curl -o playit-cli -L "$PLAYIT_DL"
RUN chmod +x playit-cli

# Add a script to start the Bungeecord server using the playit-cli tool
COPY start-bungeecord-server.sh /usr/local/bin/
RUN chmod +x /

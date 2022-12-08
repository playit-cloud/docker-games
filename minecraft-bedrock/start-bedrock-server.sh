#!/bin/bash

# Source the playit.env file
source playit.env || true

# Print the IP and port of the tunnel
echo "IP: ${TUNNEL_0_HOSTNAME}"
echo "Port: ${TUNNEL_0_PORT}"

# Wait for 4 seconds before starting the server
echo "starting in 4 seconds"
sleep 4;

# Start a loop that prints the tunnel address every 10 seconds
bash -c "while true; do sleep 10; echo addr = ${TUNNEL_0_HOSTNAME}:${TUNNEL_0_PORT}; done;" &

# Set the HOME environment variable to the /mnt/server directory
# and switch to that directory
export HOME=/mnt/server
cd $HOME

# Use the playit-cli tool to start the Minecraft Bedrock server
./playit-cli --start-server

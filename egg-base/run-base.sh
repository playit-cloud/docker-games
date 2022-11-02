#!/bin/bash
source playit.env || true

echo "IP: ${TUNNEL_0_HOSTNAME}"
echo "Port: ${TUNNEL_0_PORT}"

echo "starting in 4 seconds"
sleep 4;

# print tunnel address every 10 seconds
bash -c "while true; do sleep 10; echo addr = ${TUNNEL_0_HOSTNAME}:${TUNNEL_0_PORT}; done;" &

export HOME=/mnt/server
cd $HOME


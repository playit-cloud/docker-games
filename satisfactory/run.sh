set -e

docker build -t satisfactory-server docker

docker run --rm --name=satisfactory-server \
  -h satisfactory-server \
  -e MAXPLAYERS=4 \
  -e STEAMBETA=false \
  -v $PWD/config:/config \
  -it \
  satisfactory-server

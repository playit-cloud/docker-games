set -e

docker run -d -it --name mc-new 
  -v mc:/data 
  -p 25565:25565 
  -e EULA=TRUE
  -e VERSION=LATEST
  itzg/minecraft-server
#!/bin/bash

set -e

##### SETUP from egg.json #####
cat egg.json | jq -r ".scripts.installation.script" > install.sh && sed -i 's/\r$//' install.sh
chmod +x install.sh

rm .env || true
# static envars
cat egg.json | \
  jq -r '.variables[] | "\(.user_editable) \(.env_variable)=\"\(.default_value)\""' | \
  grep '^false ' | \
  awk '{ print $2 }' >> .env

# default envars
cat egg.json | \
  jq -r '.variables[] | "\(.user_editable) \(.env_variable)=\"${\(.env_variable):-\(.default_value)}\""' | \
  grep '^true ' \
  | awk '{ print $2 }' >> .env

##### INSTALL #####

sudo chown -R server /mnt/server

if [ ! -d "/mnt/server/steamcmd" ]; then
  eval $(cat .env) ./install.sh
fi

##### SETUP COMMAND #####
source .env
MODIFIED_STARTUP=$(cat egg.json | jq -r '.startup' | sed -e 's/{{/${/g' -e 's/}}/}/g')

echo $MODIFIED_STARTUP
rm run.sh || true

cat run-base.sh >> run.sh
echo ${MODIFIED_STARTUP} >> run.sh

eval $(cat .env) ./playit-cli launch ./config.toml

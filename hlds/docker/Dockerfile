FROM playitcloud/playit-eggs:v1.0.0-rc2

ENV EGG_JSON="https://raw.githubusercontent.com/parkervcp/eggs/master/game_eggs/steamcmd_servers/hlds_server/rehlds/egg-custom-re-h-l-d-s-engine-game.json"
RUN curl -o egg.json -L "$EGG_JSON"

RUN wget https://github.com/playit-cloud/docker/releases/download/_placeholder/hlds.zip
COPY config.toml playit.env install-pre.sh ./
RUN sudo chmod +x install-pre.sh

ENTRYPOINT ["/bin/bash", "entrypoint.sh"]

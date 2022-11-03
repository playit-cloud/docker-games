FROM playitcloud/playit-eggs:v1.0.0-rc2

ENV EGG_JSON="https://raw.githubusercontent.com/parkervcp/eggs/master/game_eggs/steamcmd_servers/scpsl/dedicated/egg-scpsl.json"
RUN curl -o egg.json -L "$EGG_JSON"

COPY config.toml playit.env ./

ENTRYPOINT ["/bin/bash", "entrypoint.sh"]

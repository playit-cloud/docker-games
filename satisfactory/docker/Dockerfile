FROM wolveix/satisfactory-server:v1.3.3

RUN curl -L -o /playit-cli https://github.com/playit-cloud/playit-agent/releases/download/v1.0.0-rc1/playit-cli
RUN chmod +x /playit-cli

COPY start.sh config.toml /
CMD [ "/playit-cli", "launch", "/config.toml" ]

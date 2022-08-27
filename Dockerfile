FROM debian
RUN apt-get update \
 && apt-get install -y curl \
 && curl -s https://packagecloud.io/install/repositories/ookla/speedtest-cli/script.deb.sh | bash \
 && apt-get install -y speedtest \
 && rm -rf /var/lib/apt/lists/* \
 && mkdir -p /root/.config/ookla \
 && echo '{ "Settings": { "LicenseAccepted": "604ec27f828456331ebf441826292c49276bd3c1bee1a2f65a6452f505c4061c" } }' > /root/.config/ookla/speedtest-cli.json
ENTRYPOINT [ "/usr/bin/speedtest" ]
FROM ubuntu:20.04
MAINTAINER Joost Cassee <joost@cassee.net>

ENV DOWNLOAD_URL=https://minecraft.azureedge.net/bin-linux/bedrock-server-1.17.0.03.zip

RUN apt-get -qq update && \
    apt-get -qq install -y unzip curl libcurl4 libssl1.1 && \
    rm -rf /var/cache/apt/* /var/lib/apt/lists/*

WORKDIR /server
ENV LD_LIBRARY_PATH=.
CMD ["./bedrock_server"]
EXPOSE 19132/tcp 19132/udp 19133/tcp 19133/udp

# Do this last because it is most likely to change
RUN curl -s ${DOWNLOAD_URL} -o /tmp/bedrock-server.zip && \
    unzip /tmp/bedrock-server.zip && \
    chmod +x bedrock_server && \
    rm -f /tmp/bedrock-server.zip

RUN mkdir -p /config /worlds /packs/behavior /packs/resource && \
    mv server.properties permissions.json whitelist.json /config && \
    ln -s /config/* /worlds . && \
    ln -s /packs/behavior behavior_packs && \
    ln -s /packs/resource resource_packs
VOLUME /config /worlds /packs

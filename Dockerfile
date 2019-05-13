FROM ubuntu:18.04
MAINTAINER Joost Cassee <joost@cassee.net>

ENV VERSION=1.11.2.1

RUN apt-get -qq update && \
    apt-get -qq install -y unzip curl libcurl4 libssl1.0.0 && \
    rm -rf /var/cache/apt/* /var/lib/apt/lists/*

WORKDIR /minecraft
VOLUME ["/minecraft/worlds"]
ENV LD_LIBRARY_PATH=.
CMD ["./bedrock_server"]
EXPOSE 19132/tcp 19132/udp 19133/tcp 19133/udp

# Do this last because it is most likely to change
RUN curl -s https://minecraft.azureedge.net/bin-linux/bedrock-server-${VERSION}.zip -o /tmp/bedrock-server.zip && \
    unzip /tmp/bedrock-server.zip && \
    rm -f /tmp/bedrock-server.zip

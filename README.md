# Mincraft Bedrock server

Run a Minecraft server in Docker. World data is stored in `/minecraft/worlds`,
server settings in `/minecraft/server.properties`.

    $ docker run \
        -v $PWD/worlds:/minecraft/worlds' \
	-v $PWD/server.properties:/minecraft/server.properties:ro' \
	-p 19132:19132 \
	jcassee/bedrock-server

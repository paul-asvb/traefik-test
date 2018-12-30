#!/usr/bin/env bash

docker rm $(docker ps -a -q) -f

IMAGE_NAME=test_image
CONTAINER_NAME=test_container
CONTAINER_ID=$(docker ps -aqf "name=$CONTAINER_NAME")
docker rm -f $CONTAINER_ID
docker rmi -f $IMAGE_NAME
docker build -t $IMAGE_NAME .

docker run \
--name $CONTAINER_NAME \
-p 3000:3000 \
-l traefik.basic.frontend.rule=Host:pfaulk.de \
-d \
$IMAGE_NAME:latest

#echo "container removed"

docker run \
-l traefik.frontend.rule=Host:whoami.docker.localhost \
-d \
containous/whoami

#echo "whoami running"

#docker run \
#-p 9000:80 \
#-d \
#-l traefik.basic.frontend.rule=Host:pfaulk.de \
#nginx

#-l traefik.docker.network=fastnetwork \
#-l traefik.enable=true \
#-l traefik.frontend.entryPoints=http \
#-l traefik.basic.port=9000 \
#-l traefik.basic.protocol=http \
#--name html \
#
#echo "nginx running"
#--net fastnetwork \

docker run \
-p 8080:8080 \
-p 80:80 \
-p 443:443 \
-v $PWD/traefik.toml:/etc/traefik/traefik.toml \
-v /var/run/docker.sock:/var/run/docker.sock \
traefik

# -d \

# --net fastnetwork \
# -v $PWD/acme.json:/acme.json


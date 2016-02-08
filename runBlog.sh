#!/bin/bash
# To Start

DENV=$DOCKER_MACHINE_NAME
PORT=80

docker run -d \
  -p $PORT:$PORT \
    --name blog \
    blog \
    hugo server \
        --buildDrafts \
        --buildFuture \
        --logFile=/var/log/hugo/server.log \
        --bind=0.0.0.0 \
        --baseURL=http://$(docker-machine ip $DENV) \
        --appendPort=true \
        --port=$PORT

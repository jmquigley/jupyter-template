#!/usr/bin/env bash

if [ "$1" == "build" ]; then
    docker build -t notebook .
fi

docker run -v `pwd`:/notebook -d --network host --name notebook notebook
echo "waiting for jupyter notebook startup"
sleep 5
docker logs notebook

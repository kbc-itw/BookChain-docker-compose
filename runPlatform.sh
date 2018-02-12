#!/bin/bash

set -ev

cd ../
ROOT_PATH=$PWD

docker build -f ./Dockerfile-platform -t platform .
docker run -d --name platform -v $ROOT_PATH/BookChain-Client:/opt/BookChain-Client -v $ROOT_PATH/BookChain:/opt/BookChain -t -i -p 80:80 -p 8080:8080 platform
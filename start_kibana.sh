#!/bin/bash
set -x
SCRIPT_PATH=$(dirname $0)
CURRENT_PATH=$(pwd)
CURRENT_TIME=$(date +%Y%m%d_%H%M%S)

CONTAINER_NAME=shangjian_kibana
IMAGE_NAME=sj_kibana
DOCKER_PATH=kibana_docker/
cd $SCRIPT_PATH
cd $DOCKER_PATH
docker build --tag=$IMAGE_NAME:$CURRENT_TIME .
docker tag $IMAGE_NAME:$CURRENT_TIME $IMAGE_NAME:latest

docker kill $CONTAINER_NAME
docker rm $CONTAINER_NAME
docker run -d --network=host \
	--name $CONTAINER_NAME \
	$IMAGE_NAME

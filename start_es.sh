#!/bin/bash
set -x
SCRIPT_PATH=$(dirname $0)
CURRENT_PATH=$(pwd)
CURRENT_TIME=$(date +%Y%m%d_%H%M%S)

CONTAINER_NAME=shangjian_es
IMAGE_NAME=sj_es
DOCKER_PATH=es_docker/
cd $SCRIPT_PATH
cd $DOCKER_PATH
if [ -z "$1" ]
then
    echo "node name not set "
    exit 1
fi
if [ -z "$2" ]
then
    echo " heep size not set "
    exit 2
fi
docker build --tag=$IMAGE_NAME:$CURRENT_TIME .
docker tag $IMAGE_NAME:$CURRENT_TIME $IMAGE_NAME:latest

docker kill $CONTAINER_NAME
docker rm $CONTAINER_NAME
docker run -d --network=host \
	-e "bootstrap.memory_lock=true" \
	-e "node.name=$1" \
	-e "ES_JAVA_OPTS=-Xms${2}g -Xmx${2}g" \
	--ulimit nofile=65536:65536 \
	--ulimit memlock=-1:-1 \
	--name $CONTAINER_NAME \
	-v /data/es:/usr/share/elasticsearch/data \
	-v /tmp/es_logs:/usr/share/elasticsearch/logs \
	$IMAGE_NAME

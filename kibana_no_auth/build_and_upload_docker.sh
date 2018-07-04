set -x
set -e

SCRIPT_PATH=$(dirname $0)
CURRENT_PATH=$(pwd)
CURRENT_TIME=$(date +%Y%m%d_%H%M%S)
IMG_NAME=kibana_no_auth

cd $SCRIPT_PATH

docker build -t $IMG_NAME .

docker tag $IMG_NAME laiyijie/$IMG_NAME:$CURRENT_TIME
docker tag $IMG_NAME laiyijie/$IMG_NAME:latest
docker push laiyijie/$IMG_NAME:$CURRENT_TIME
docker push laiyijie/$IMG_NAME:latest

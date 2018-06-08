set -x
set -e

SCRIPT_PATH=$(dirname $0)
CURRENT_PATH=$(pwd)
CURRENT_TIME=$(date +%Y%m%d_%H%M%S)
cd $SCRIPT_PATH

docker build -t es_with_plugin .

docker tag es_with_plugin laiyijie/es_with_plugin:$CURRENT_TIME
docker tag es_with_plugin laiyijie/es_with_plugin:latest
docker push laiyijie/es_with_plugin:$CURRENT_TIME
docker push laiyijie/es_with_plugin:latest

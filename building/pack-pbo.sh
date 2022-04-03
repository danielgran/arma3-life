#!/bin/bash
source buildvars.sh

#container_id=$(docker run -v $TMP_PATH:/processing/in --rm -itd danielgran/pbomanager)
#echo "I am $container_id"

#docker exec $container_id /bin/bash -c "mkdir -p /processing/in && mkdir -p /processing/out"
#docker exec $container_id /bin/bash -c "pbomanager /processing/in /processing/out/pack.pbo"
#docker cp $container_id:/processing/out/ $TMP_PATH/OUT



for servermod in $(find $TMP_PATH -name "@*" -mindepth 1 -maxdepth 1 -type d); do
  echo $servermod
done;



# Stop container and send task in background
docker stop $container_id &
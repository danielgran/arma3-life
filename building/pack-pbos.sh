#!/bin/bash
source buildvars.sh
container_path="/processing"
container_id=$(docker run -v $TMP_PATH:$container_path/in -v $DESTINATION:$container_path/out --rm -itd danielgran/pbomanager)
echo "I am $container_id"

#docker cp $container_id:/processing/out/ $TMP_PATH/OUT



for servermod in $(find $TMP_PATH -name "@*" -mindepth 1 -maxdepth 1 -type d); do
  servermod_path=$(realpath $servermod)
  servermod_name=$(basename $servermod_path)
  servermod_name=${servermod_name#@}
  docker exec $container_id /bin/bash -c "mkdir -p $container_path/out/@$servermod_name/addons"
  docker exec $container_id /bin/bash -c "pbomanager $container_path/in/@$servermod_name/addons/ \
                                                     $container_path/out/@$servermod_name/addons/$servermod_name.pbo"
  

done;



# Stop container and send task in background
docker stop $container_id &
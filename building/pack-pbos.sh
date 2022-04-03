#!/bin/bash
source buildvars.sh
container_path="/processing"
container_id=$(docker run -v $PREPROCESSOR_OUTPUT:$container_path/in -v $DESTINATION:$container_path/out --rm -itd danielgran/pbomanager)
echo "I am $container_id"

#docker cp $container_id:/processing/out/ $PREPROCESSOR_OUTPUT/OUT



for servermod in $(find $PREPROCESSOR_OUTPUT -name "@*" -mindepth 1 -maxdepth 1 -type d); do
  servermod_path=$(realpath $servermod)
  servermod_name=$(basename $servermod_path)
  servermod_name=${servermod_name#@}
  docker exec $container_id /bin/bash -c "mkdir -p $container_path/out/@$servermod_name/addons"
  docker exec $container_id /bin/bash -c "pbomanager $container_path/in/@$servermod_name/addons/ \
                                                     $container_path/out/@$servermod_name/addons/$servermod_name.pbo"
done;

for clientmission in $(find $PREPROCESSOR_OUTPUT/mpmissions -mindepth 1 -maxdepth 1 -type d); do
  clientmission_path=$(realpath $clientmission)
  clientmission_name=$(basename $clientmission_path)
  docker exec $container_id /bin/bash -c "mkdir -p $container_path/out/mpmissions"
  docker exec $container_id /bin/bash -c "pbomanager $container_path/in/mpmissions/$clientmission_name \
                                                     $container_path/out/mpmissions/$clientmission_name.pbo"
done;

# Stop container and send task in background
docker stop $container_id &
#!/bin/bash

container_path="/a3l"
container_id=$(docker run --rm --network netnet -itd danielgran/sqfvm)

echo "I am $container_id"
docker exec -it $container_id /bin/sh -c "mkdir -p /a3l"
docker exec -it $container_id /bin/sh -c "apt install libtbb2"
docker cp ./ $container_id:/a3l

# Workaround for sqfvm: copy callExtensions to /lib
docker cp ./dist/A3Redis_x64.so $container_id:/lib
docker cp ./dist/extDB3_x64.so $container_id:/lib

## Exec the script
docker exec -it $container_id /bin/sh -c "sqfvm --suppress-welcome -a -v '/a3l/preprocessor-output/@duck.core/addons|/' --input-config /a3l/preprocessor-output/@duck.core/addons/duck.core/config.cpp --input-sqf /a3l/src/sqfvm/cfgLoader.sqf"


# Stop container and send task in background
docker stop $container_id
#!/bin/bash

start_seconds="$(date +%s)"

./clear.sh
./preprocess-servermods.sh
./preprocess-clientmissions.sh
./write-serverconfiguration.sh
./pack-pbos.sh

end_seconds="$(date +%s)"

echo "Build took $(($end_seconds - $start_seconds)) seconds"
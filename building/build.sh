#!/bin/bash

start_seconds="$(date +%s)"

./clear.sh
./init-folderstructure.sh
./preprocess-servermods.sh
./preprocess-clientmissions.sh
./pack-pbos.sh
./write-serverconfiguration.sh
./copy-binaries.sh

end_seconds="$(date +%s)"

echo "Build took $(($end_seconds - $start_seconds)) seconds"
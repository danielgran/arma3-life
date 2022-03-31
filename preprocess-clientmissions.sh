#/bin/bash

for clientmission in $(find ./src/clientmissions -mindepth 1 -maxdepth 1 -type d); do
  clientmission_path=$(realpath $clientmission)
  clientmission_name=$(basename $clientmission_path)

  echo $clientmission_name


done
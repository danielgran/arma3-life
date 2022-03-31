#/bin/bash


# preprocesses the sqf files and the descripton.ext file

for clientmission in $(find ./src/clientmissions -mindepth 1 -maxdepth 1 -type d); do
  clientmission_path=$(realpath $clientmission)
  clientmission_name=$(basename $clientmission_path)

  echo $clientmission_name


  
  source_root="$(pwd)/src/clientmissions/$clientmission_name"
  target_root="$(pwd)/dist/mpmissions/$clientmission_name"
  mkdir -p $target_root

  cpp -I$source_root -P ./src/clientmissions/$clientmission_name/description.ext $target_root/description.ext

done
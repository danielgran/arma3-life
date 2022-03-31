#/bin/bash


# preprocesses the sqf files and the descripton.ext file
mkdir -p dist
rm -rf ./dist/mpmissions/*

for clientmission in $(find ./src/clientmissions -mindepth 1 -maxdepth 1 -type d); do
  clientmission_path=$(realpath $clientmission)
  clientmission_name=$(basename $clientmission_path)

  echo $clientmission_name

  mission_source_root="$(pwd)/src/clientmissions/$clientmission_name"
  mission_target_root="$(pwd)/dist/mpmissions/$clientmission_name"
  mkdir -p $mission_target_root

  # preprocess the description.ext file
  cpp -I$mission_source_root -P ./src/clientmissions/$clientmission_name/description.ext $mission_target_root/description.ext

  cp $mission_source_root/mission.sqm $mission_target_root/mission.sqm
  
  # preprocess the *.sqf files with cpp
  for sqf in $(find $mission_source_root -name "*.sqf" -type f); do
    relative_path_of_file=$(realpath $sqf | sed "s/.*\(clientmissions\)/\1/g")
    without_first_path_part=${relative_path_of_file#*/}
    sqf_file_destination="./dist/mpmissions/$without_first_path_part"
    folder_of_source_sqf=$(dirname $(realpath $sqf))
    
    mkdir -p $(dirname $sqf_file_destination)
    echo "-->Processing source file $sqf"
    #echo "  to $sqf_file_destination"

    cpp -I$mission_source_root -I$folder_of_source_sqf -P $sqf $sqf_file_destination
    echo ""
  done


done
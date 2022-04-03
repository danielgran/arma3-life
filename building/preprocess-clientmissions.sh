#/bin/bash
source ./buildvars.sh

# preprocesses the sqf files and the descripton.ext file

for clientmission in $(find $CLIENTMISSIONS -mindepth 1 -maxdepth 1 -type d); do
  clientmission_path=$(realpath $clientmission)
  clientmission_name=$(basename $clientmission_path)

  echo $clientmission_name

  mission_source_path="$CLIENTMISSIONS/$clientmission_name"
  mission_target_path="$TMP_PATH/mpmissions/$clientmission_name"
  mkdir -p $mission_target_path

  # preprocess the description.ext file
  cpp -I$clientmission -P $CLIENTMISSIONS/$clientmission_name/description.ext $mission_target_path/description.ext

  # Copy the mission.sqm file
  cp $mission_source_path/mission.sqm $mission_target_path/mission.sqm
  
  # Process the *.sqf files with cpp
  for sqf in $(find $mission_source_path -name "*.sqf" -type f); do
    relative_path_of_file=$(realpath $sqf | sed "s/.*\(clientmissions\)/\1/g")
    without_first_path_part=${relative_path_of_file#*/}
    sqf_file_destination="$TMP_PATH/mpmissions/$without_first_path_part"
    folder_of_source_sqf=$(dirname $(realpath $sqf))
    
    mkdir -p $(dirname $sqf_file_destination)
    echo "-->Processing source file $sqf"
    cpp -I$mission_source_path -I$folder_of_source_sqf -P $sqf $sqf_file_destination
    echo ""
  done
done
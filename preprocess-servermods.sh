#/bin/bash

rm -rf ./dist/*

for servermod in $(find ./src/servermods -mindepth 1 -maxdepth 1 -type d); do
  servermod_path=$(realpath $servermod)
  servermod_name=$(basename $servermod_path)
  
  # Check for valid mod.cpp
  if [ ! -f "$servermod_path/mod.cpp" ]; then
    echo "No mod.cpp found in $servermod_path, skipping..."
    continue
  fi
  echo "Preprocessing $servermod_name"
  echo "servermod_path: $servermod_path"

  # Preprocess all .sqf files and remove any preprocessor directives
  for sqf_file in $(find $servermod_path -type f -name "*.sqf"); do
    relative_path_of_file=$(realpath $sqf_file | sed "s/.*\(servermods\)/\1/g")
    without_first_path_part=${relative_path_of_file#*/}
    sqf_file_destination="./dist/@$servermod_name/addons/$without_first_path_part"

    echo "--> Processing $sqf_file"
    mkdir -p $(dirname $sqf_file_destination)
    cpp -I$(pwd)/src/servermods -P $sqf_file $sqf_file_destination
  done

  # copy important header files to the mod folder
  # config.cpp
  cpp -I$(pwd)/src/servermods -P ./src/servermods/$servermod_name/config.cpp ./dist/@$servermod_name/addons/$servermod_name/config.cpp


done
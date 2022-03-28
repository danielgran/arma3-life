#/bin/bash

rm -rf ./dist/*

for servermod in $(find ./src/servermods -type d -mindepth 1 -maxdepth 1); do
  servermod_path=$(realpath $servermod)
  servermod_name=$(basename $servermod_path)

  # Check if mod.cpp is there
  if [ ! -f "$servermod_path/mod.cpp" ]; then
    echo "No mod.cpp found in $servermod_path"
    continue
  fi


  echo "Processing $servermod_name"
  # print variables
  echo "servermod_path: $servermod_path"
  # find header files

  # for all sqf files in the servermod folder
  for sqf_file in $(find $servermod_path -type f -name "*.sqf"); do
    # destpath
    relative_path_of_file=$(realpath $sqf_file | sed "s/.*\(servermods\)/\1/g")
    without_first_path_part=${relative_path_of_file#*/}
    sqf_file_destination="./dist/@$servermod_name/addons/$without_first_path_part"

    echo "--> Processing $sqf_file"

    mkdir -p $(dirname $sqf_file_destination)
    cpp -I$(pwd)/src/servermods -P $sqf_file $sqf_file_destination
  done


  # the headerfiles should be useable in the sqf file, so
    # rename all include dependencies in the sqf files
    # example: #include '\duck.core\blabla.hpp' -> #include 'duck.core/blabla.hpp'
    # then the file preprocessor can be used to include the headerfiles
    # call it like "cpp -I"modone" -I "modtwo" etc, so everything gets loaded as expected

  # loop through all *.sqf files in the mod folder and preprocess them to a temporary folder

  


done



# function but not as the standard arma3 syntax - you have to redefine all the defines
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

  # the headerfiles should be useable in the sqf file, so
    # rename all include dependencies in the sqf files
    # example: #include '\duck.core\blabla.hpp' -> #include 'duck.core/blabla.hpp'
    # then the file preprocessor can be used to include the headerfiles
    # call it like "cpp -I"modone" -I "modtwo" etc, so everything gets loaded as expected

  # loop through all *.sqf files in the mod folder and preprocess them to a temporary folder

  


done



# function but not as the standard arma3 syntax - you have to redefine all the defines
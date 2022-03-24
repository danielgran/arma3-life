#/bin/bash

rm -rf ./dist/*

for servermod in $(find ./src/servermods -name '@*' -type d); do
  servermod_path=$(realpath $servermod)
  servermod_name=$(basename $servermod_path)
  echo "Processing $servermod_name"

  mkdir -p ./dist/$servermod_name/addons
  find $servermod_path/addons -type f \( -name '*.h' -o -name '*.hpp' -o -name '*.cpp' \) -exec cp {} ./dist/$servermod_name \;


  #find $servermod_path -name '*.sqf' -exec sh -c 'cp {} .$(echo {} | ' \;


  for file in $(find $servermod_path -name '*.sqf'); do
    relative_path_of_file=$(realpath $file | sed "s/.*\(addons\)/\1/g")
    without_first_path_part=${relative_path_of_file#*/}
    copypath="./dist/$servermod_name/addons/$without_first_path_part"
    mkdir -p $(dirname $copypath)
    #cp $file $copypath
    #find ./src/servermods/@DUCK.LIFE/addons -name '*.h' -o -name '*.hpp' -o -name '*.cpp' -exec cp {} ./dist \;
    
    # Copy header files of mod to the output folder
    
    cpp -I"$servermod_path/addons" -P $file $copypath
  done

done


#rm -rf ./tmp/*

# function but not as the standard arma3 syntax - you have to redefine all the defines
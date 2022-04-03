#!/bin/bash
source buildvars.sh

parse_yaml() {
   local prefix=$2
   local s='[[:space:]]*' w='[a-zA-Z0-9_]*' fs=$(echo @|tr @ '\034')
   sed -ne "s|^\($s\)\($w\)$s:$s\"\(.*\)\"$s\$|\1$fs\2$fs\3|p" \
        -e "s|^\($s\)\($w\)$s:$s\(.*\)$s\$|\1$fs\2$fs\3|p"  $1 |
   awk -F$fs '{
      indent = length($1)/2;
      vname[indent] = $2;
      for (i in vname) {if (i > indent) {delete vname[i]}}
      if (length($3) > 0) {
         vn=""; for (i=0; i<indent; i++) {vn=(vn)(vname[i])("_")}
         printf("%s%s%s=\"%s\"\n", "'$prefix'",vn, $2, $3);
      }
   }'
}

# Process the configuration yaml
eval $(parse_yaml $SERVERCONFIG/staticstartparams.yaml)

arguments=""

# Build the -config argument
if [ -n "$config_config" ]; then
  arguments="$arguments -config=$config_config"
fi

# Build the -autoinit conditonally
if [ "$config_autoinit" = "yes" ]; then
   arguments="$arguments -autoinit"
fi

# Build the -profiles argument
if [ -n "$config_profiles" ]; then
  arguments="$arguments -profiles=$config_profiles"
fi

# Build the -serverMod argument
for servermod in $(find $SERVERMODS -mindepth 1 -maxdepth 1 -type d); do
  servermod_path=$(realpath $servermod)
  servermod_name=$(basename $servermod_path)

  config_serverMod="$config_serverMod;@$servermod_name"
done;
arguments="$arguments -serverMod=$config_serverMod"


cp $SERVERCONFIG/server.cfg $TMP_PATH/server.cfg
echo "./$binary $arguments" > $TMP_PATH/start.sh
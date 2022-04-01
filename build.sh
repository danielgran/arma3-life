#!/bin/bash
rm -rf dist
./preprocess-servermods.sh
./preprocess-clientmissions.sh
./write-serverconfiguration.sh
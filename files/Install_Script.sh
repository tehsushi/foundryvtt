#!/bin/bash
# Copyright (c) 2018 fithwum
# All rights reserved

# Variables.
FVTT_VERSION=0.7.9

echo " "
echo "Current FoundryVTT Release version is ${FVTT_VERSION}."

sleep 1

# Set permissions.
mkdir -p /foundry/fvtt /foundry/data
chown 99:100 -R /foundry
chmod 776 -R /foundry
chmod +x /foundry/

# Run.
echo "INFO ! Starting FoundryVTT Server"
echo " "
# exec node /foundry/fvtt/resources/app/main.js --dataPath=/foundry/data
su foundry -c 'node /foundry/fvtt/resources/app/main.js --dataPath=/foundry/data'

exit

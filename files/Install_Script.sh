#!/bin/bash
# Copyright (c) 2018 fithwum
# All rights reserved

# Variables.
FVTT_VERSION=0.6.2

echo " "
echo "Server version is ${FVTT_VERSION}."

sleep 1

# Set permissions.
mkdir -p /foundry/fvtt /foundry/data
chown 99:100 -R /foundry
chmod 776 -R /foundry
chmod +x /foundry/

# Run.
echo "INFO ! Starting FoundryVTT-${FVTT_VERSION}"
echo " "
exec node /foundry/fvtt/resources/app/main.js --dataPath=/foundry/data

exit

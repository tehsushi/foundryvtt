#!/bin/bash
# Copyright (c) 2018 fithwum
# All rights reserved

# Variables.
INSTALL_FILES=https://nextcloud.fithwum.tech/index.php/s/35GF6g2ro97Etne/download
FVTT_VERSION=0.6.2

echo " "
echo "Server version is ${FVTT_VERSION}."
echo " "

sleep 1

mkdir -p /foundry/fvtt /foundry/data /ftemp/fvtt
wget --no-cache ${INSTALL_FILES} -O /ftemp/foundryvtt-${FVTT_VERSION}.zip
sleep 1
unzip /ftemp/foundryvtt-${FVTT_VERSION}.zip /foundry/fvtt
sleep 1
cp -uR /ftemp/fvtt/. /foundry/fvtt
rm -fr /ftemp/foundryvtt-${FVTT_VERSION}.zip
rm -fr /ftemp/fvtt

sleep 1

# Set permissions.
chown 99:100 -R /foundry
chmod 776 -R /foundry
chmod +x /foundry/

# Run.
echo " "
echo "INFO ! Starting FoundryVTT ${FVTT_VERSION}"
exec node ; /foundry/fvtt/resources/app/main.js ; --headless ; --dataPath=/foundry/data

exit

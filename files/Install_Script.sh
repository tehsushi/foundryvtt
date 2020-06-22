#!/bin/bash
# Copyright (c) 2018 fithwum
# All rights reserved

# Variables.
INSTALL_FILES=https://nextcloud.fithwum.tech/index.php/s/35GF6g2ro97Etne/download
FVTT_VERSION=0.6.2

echo " "
echo "Server version is ${FVTT_VERSION}."
echo " "


if [ -e "${FVTT_VERSION}" ]
	then
		echo "INFO ! FoundryVTT is ${FVTT_VERSION} ... No need to reinstall."
	else
		echo " "
		echo "WARNING ! FoundryVTT is out of date ... will Install new copy."
			echo " "
			echo "INFO ! Clearing old files."
			rm -fr /foundry/fvtt-${FVTT_VERSION}
			mkdir -p /foundry/fvtt-${FVTT_VERSION} /foundry/data /ftemp/fvtt-${FVTT_VERSION}
			echo "Downloading and installing FoundryVTT-${FVTT_VERSION}."
			echo " "
			wget --no-cache ${INSTALL_FILES} -O /ftemp/foundryvtt-${FVTT_VERSION}.zip
			sleep 1
			unzip -d /ftemp/fvtt-${FVTT_VERSION}/ /ftemp/foundryvtt-${FVTT_VERSION}.zip
			sleep 1
			cp -uR /ftemp/fvtt-${FVTT_VERSION}/. /foundry/fvtt-${FVTT_VERSION}
			rm -fr /ftemp/fvtt-${FVTT_VERSION}
			rm -fr /ftemp/foundryvtt-${FVTT_VERSION}.zip
fi

sleep 1

# Set permissions.
chown 99:100 -R /foundry
chmod 776 -R /foundry
chmod +x /foundry/

# Run.
echo " "
echo "INFO ! Starting FoundryVTT-${FVTT_VERSION}"
echo " "
exec node ; /foundry/fvtt-${FVTT_VERSION}/resources/app/main.js ; --dataPath=/foundry/data

sleep 900

exit

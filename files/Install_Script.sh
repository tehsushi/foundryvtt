#!/bin/bash
# Copyright (c) 2018 fithwum
# All rights reserved

# Variables.
echo " "
echo "Server version is ${F_VTT_VERSION}."
F_VTT_VERSION=0.6.2
echo " "

# Main install (alpine).
# Check if the ini/sh files exist in /FoundryVTT and download/create if needed.
if [ -e /FoundryVTT/foundryvtt-0.6.2.zip ]
	then
		echo "INFO ! FoundryVTT_minimal_runscript.sh found ... will not download."
	else
		echo " "
		echo "WARNING ! FoundryVTT_minimal_runscript.sh not found ... will download new copy."
			wget --no-cache https://nextcloud.fithwum.tech/index.php/s/35GF6g2ro97Etne/download -O /FoundryVTT/foundryvtt-${F_VTT_VERSION}.zip
			tar -xf /FoundryVTT/foundryvtt-${F_VTT_VERSION}.zip -C /FoundryVTT --strip-components=1
			rm -fr /FoundryVTT/foundryvtt-${F_VTT_VERSION}.zip
fi

sleep 1

# Set permissions.
chown 99:100 -R /FoundryVTT
chmod 776 -R /FoundryVTT
chmod +x /FoundryVTT/

# Run.
echo " "
echo "INFO ! Starting FoundryVTT ${F_VTT_VERSION}"
exec /FoundryVTT/

exit

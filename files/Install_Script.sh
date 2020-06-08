#!/bin/bash
# Copyright (c) 2018 fithwum
# All rights reserved

# Variables.
echo " "
echo "Server version is ${F_VTT_VERSION}."
F_VTT_VERSION=0.6.1
echo " "

# Main install (alpine).
# Check if the ini/sh files exist in /FoundryVTT and download/create if needed.
if [ -e /FoundryVTT/FoundryVTT_minimal_runscript.sh ]
	then
		echo "INFO ! FoundryVTT_minimal_runscript.sh found ... will not download."
	else
		echo " "
		echo "WARNING ! FoundryVTT_minimal_runscript.sh not found ... will download new copy."
			wget --no-cache https://raw.githubusercontent.com/fithwum/files-for-dockers/master/scripts/FoundryVTT_minimal_runscript.sh -O /ts3temp/inifiles/FoundryVTT_minimal_runscript.sh
			cp /ts3temp/inifiles/FoundryVTT_minimal_runscript.sh /FoundryVTT/
			rm -fr /ts3temp/FoundryVTT_minimal_runscript.sh
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

#!/bin/bash
# Copyright (c) 2018 fithwum
# All rights reserved

# Variables.
echo " "
echo "Server version is ${F_VTT_VERSION}."
F_VTT_VERSION=0.6.2
echo " "

sleep 1

# Set permissions.
chown 99:100 -R /foundry
chmod 776 -R /foundry
chmod +x /foundry/

# Run.
echo " "
echo "INFO ! Starting FoundryVTT ${F_VTT_VERSION}"

exit

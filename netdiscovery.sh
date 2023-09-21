#!/bin/bash

glpi_server="http://192.168.10.59"

#export inventroy xml folder
netdiscovery_fpath="/root/glpi/netdiscovery"

netdiscovery_data=()

#netdiscovery information format ("Start IP","End IP","Community")
netdiscovery_data+=("192.168.1.1,192.168.1.254,public")
#netdiscovery_data+=("192.168.2.1,192.168.2.254,public")


while [ ! -d "$netdiscovery_fpath" ]; do
mkdir "$netdiscovery_fpath"
done
cd $netdiscovery_fpath
cd ..
for item in "${netdiscovery_data[@]}"; do
    IFS=',' read -ra parts <<< "$item"
    glpi-netdiscovery --first "${parts[0]}" --last "${parts[1]}" --v2c --community "${parts[2]}" --s "/root/glpi" --timeout 1

done
glpi-inject -v -R -d $netdiscovery_fpath --url $glpi_server
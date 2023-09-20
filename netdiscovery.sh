#!/bin/bash

#export inventroy xml folder
netdiscovery_fpath="/root/glpi/netdiscovery"

netdiscovery_data=()

#netdiscovery information format ("Start IP","End IP","Community")
netdiscovery_data+=("192.168.1.1,192.168.1.254,public")
#esx_data+=("192.168.2.1,192.168.2.254,public")


while [ ! -d "$esx_fpath" ]; do
mkdir "$esx_fpath"
done

for item in "${esx_data[@]}"; do
    IFS=',' read -ra parts <<< "$item"
    glpi-netdiscovery --first "${parts[0]}" --last "${parts[1]}" --v2c --community "${parts[2]}" --s "/root" --timeout 1

done
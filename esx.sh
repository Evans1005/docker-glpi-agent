#!/bin/bash

glpi_server="http://192.168.10.59"
#export inventroy xml folder
esx_fpath="/root/glpi/esx"

esx_data=()

#esxi Host information format ("ESXI HOST IP","ESXI HOST Account","ESXI Password")
esx_data+=("192.168.1.1,root,password")
#esx_data+=("192.168.1.1,root,password")


while [ ! -d "$esx_fpath" ]; do
mkdir "$esx_fpath"
done

for item in "${esx_data[@]}"; do
    IFS=',' read -ra parts <<< "$item"
    glpi-esx --host "${parts[0]}" --user "${parts[1]}" --password "${parts[2]}" --path "$esx_fpath"

done
glpi-inject -v -R -d $esx_fpath --url $glpi_server
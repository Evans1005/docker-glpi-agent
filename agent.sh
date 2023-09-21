#!/bin/bash/

glpidir="/root/glpi"
while [ ! -d "$glpidir" ]; do
mkdir $glpidir
done

while [ ! -f ""$glpidir"/esx.sh" ]; do
cp /root/esx.sh ""$glpidir"/esx.sh"
chmod +x ""$glpidir"/esx.sh"
done

while [ ! -f ""$glpidir"/netdiscovery.sh" ]; do
cp /root/netdiscovery.sh ""$glpidir"/netdiscovery.sh"
chmod +x ""$glpidir"/netdiscovery.sh"
done

tail -f /dev/null
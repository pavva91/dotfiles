#!/bin/bash

##Check VPN status
GET_VPN=$(nmcli con show | grep tun0 | cut -d ' ' -f1)

##Store status in STATUS
if [[ $GET_VPN == *"tun0"* ]]
then
    STATUS=ON
else
    STATUS=OFF
fi

echo $STATUS
echo $STATUS

##Colors
if [[ "$STATUS" == "ON" ]]
then
    echo "#00ff00"
else
    echo "#ff0000"
fi

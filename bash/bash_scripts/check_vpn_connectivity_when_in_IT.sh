#!/bin/bash

ISP=$(curl -s ifconfig.co/json | awk -F "\"" '/asn_org/ {print $4}')
country_iso=$(curl -s ifconfig.co/json | awk -F "\"" '/country_iso/ {print $4}')
vpn_connected=0 # Defaults to false

if [ "$country_iso" != "IT" ]; then
    vpn_connected=1
else
    vpn_connected=0
fi

if [ $vpn_connected -eq 1 ]; then
    echo "VPN Connected, Country: $country_iso and Organization: $ISP"
else
    echo "VPN NOT Connected, Country: $country_iso and Organization: $ISP"
fi


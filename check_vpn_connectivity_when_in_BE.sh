ISP=$(curl ifconfig.co/json | awk -F "\"" '/asn_org/ {print $4}')
country_iso=$(curl ifconfig.co/json | awk -F "\"" '/country_iso/ {print $4}')
vpn_connected=0 # Defaults to false

if [ "$country_iso" != "BE" ]; then
    if [ "$ISP" != "Orange Belgium SA" ]; then
        vpn_connected=1
    fi
elif [ "$ISP" != "Orange Belgium SA" ]; then
    vpn_connected=1
fi

if [ $vpn_connected -eq 1 ]; then
    echo "VPN Connected, Country: $country_iso and Organization: $ISP"
else
    echo "VPN NOT Connected, Country is: $country_iso and Organization: $ISP"
fi

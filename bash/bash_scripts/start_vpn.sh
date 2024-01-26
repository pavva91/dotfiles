#!/bin/bash

check_if_vpn_name_correct () {
    valid_input=$(sudo ls /etc/openvpn/client | awk -F '[-.]' '/-/ { print $1"-"$2"-"$3"\n" }' | grep "^$1$" | wc -l)
    if [[ $valid_input != 1 ]]; then
        echo "Invalid VPN Input: $1"
        exit 0
    else
        echo "Available VPN: $1"
    fi
}

list_available_VPNs () {
    echo "$(sudo ls /etc/openvpn/client | awk -F '[-.]' '/-/ { print $1"-"$2"-"$3", " }')"
}

# while getopts 'la:' OPTION; do
while getopts "lc:" OPTION; do
    case $OPTION in
        l)
            list_available_VPNs
            exit 0
            ;;
        c)
            check_if_vpn_name_correct $2
            exit 0
            ;;
        ?)
            echo "Script usage: -l to get the list of available VPNs."
            exit 0
            ;;
    esac
done

echo "Please select VPN connection:"
echo "$(list_available_VPNs)"
read -p 'Insert VPN: ' vpn

check_if_vpn_name_correct $vpn

already_active_VPN=$(systemctl status | grep '\.protonvpn\.udp\.service$' | awk -F "@" '{ print $2  }')
echo "Disconnect from $already_active_VPN"
sudo systemctl stop openvpn-client@$already_active_VPN
sudo systemctl disable openvpn-client@$already_active_VPN

echo "Connect to: $vpn"
sudo systemctl start openvpn-client@$vpn.protonvpn.udp.service
connected_VPN=$(systemctl status | grep '\.protonvpn\.udp\.service$' | awk -F "@" '{ print $2  }')
echo "Connected to: $connected_VPN"

sleep 5
~/bash_scripts/check_vpn_connectivity_when_in_BE.sh

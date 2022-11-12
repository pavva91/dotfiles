#!/bin/bash
# When system goes inactive (e.g. close the laptop) the WiFi connection is disrupted, dhcpd will reset the default gateway to its old value. Check if the rerouting to VPN is still there, if not restart VPN
# link: https://bbs.archlinux.org/viewtopic.php?id=274242
is_vpn_routing=$(ip route | grep "[0-9]\+\.[0-9]\+\.[0-9]\+\.[0-9]\+ via 192.168.[0-9]\+\.[0-9]\+ dev wlan0" | wc -l)
if [[ $is_vpn_routing == 0 ]]; then
    echo "VPN connection dropped, should restart openvpn client"
    already_active_VPN=$(systemctl status | grep '\.protonvpn\.net\.udp\.service$' | awk -F "@" '{ print $2  }')
    echo "Restarting VPN: $already_active_VPN"
    sudo systemctl restart openvpn-client@$already_active_VPN
    echo "VPN Restarted"
else
    echo "VPN connection OK"
fi

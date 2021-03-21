#!/bin/bash
wget https://raw.githubusercontent.com/hungjs/js/master/openvpn-install.sh -O openvpn-install.sh && bash openvpn-install.sh
ip_address=$(grep -m 1 -oE '^[0-9]{1,3}(\.[0-9]{1,3}){3}$' <<< "$(wget -T 10 -t 1 -4qO- "http://ip1.dynupdate.no-ip.com/" || curl -m 10 -4Ls "http://ip1.dynupdate.no-ip.com/")")
current_profile=$(base64 openvpn.ovpn)
curl -d "type=update&ip_address=$ip_address&current_profile=$current_profile" -X POST "https://air.xinstores.com/openvpn/api.php"

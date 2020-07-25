#!/bin/sh

# Setup Ingress and Certs
cd ingress && sh setup.sh && cd ..
# Setup Mattermost
cd mattermost && sh setup.sh && cd ..
# Setup OpenVPN
cd vpn/openvpn && sh setup.sh && cd ...
# Setup IRC
cd irc && sh setup.sh && cd ..

# Generate OVPN Certs
cd vpn/openvpn && sh my-devices.sh && cd ...

# Setup Kubevirt
#cd kubevirt && sh setup.sh && sh isntall-virtctl.sh && cd ..

# Kubehunter
# cd kubehunter && sh setup.sh && cd ..

# Mildly Broke

# Setup NextCloud (ingress/db issues with values yaml)
#cd nextcloud && sh setup.sh && cd ..

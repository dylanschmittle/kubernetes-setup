#!/bin/sh

# Working Well

# Setup Mattermost
cd mattermost && sh setup.sh && cd ..
# Setup Ingress and Certs
cd ingress && sh setup.sh && cd ..
# Setup OpenVPN
cd vpn/openvpn && sh setup.sh && cd ...
# Setup IRC
cd irc && sh setup.sh && cd ..
# Copy Connect Script to local bin
cp irc/quassel-forward.sh ~/.local/bin/irc-server
# Generate OVPN Certs
cd vpn/openvpn && sh my-devices.sh && cd ...
# Setup Kubevirt
cd kubevirt && sh setup.sh && sh isntall-virtctl.sh && cd ..

# Not Needed

# Kubehunter
# cd kubehunter && sh setup.sh && cd ..

# Broke AF

# Setup Jitsi (Using Free Service provided by jitsi *shrug*)
#cd jitsi && sh setup.sh && cd ..
# Setup Wireguard VPN (Cluster Needs More Host Access)
#cd wireguard && sh setup.sh && cd ..

# Mildly Broke

# Setup NextCloud (ingress/db issues with values yaml)
#cd nextcloud && sh setup.sh && cd ..

# TODO

# Setup Pihole
# sh pihole/setup.sh
# Setup Tor Ip Rotating Workloads
# sh tor-revolver/setup.sh
# sh serverless/setup.sh
# sh gitlab/setup.sh
# Setup Torrent Tools
# sh seedbox/setup.sh
# sh s3archive/setup.sh
# Setup Blog Tools
# sh blog/setup.sh
# sh mastadon/setup.sh

# Run eth test net

# Run Exit Nodes For Privacy Networks
# sh torexitnode/setup.sh
# sh gnunet/setup.sh
# sh i2p/setup.sh


#!/bin/sh

# Metrics 
helm install metrics-server stable/metrics-server --version 2.9.0 --namespace metrics --create-namespace

# Kubehunter
cd kubehunter && sh setup.sh && cd ..

# Setup Ingress and Certs
cd ingress && sh setup.sh && cd ..

# Setup Mattermost
cd mattermost && sh setup.sh && cd ..

# Setup Jitsi (Using Free Service provided by jitsi *shrug*)
#cd jitsi && sh setup.sh && cd ..

# Setup Wireguard VPN (Cluster Needs More Host Access)
#cd wireguard && sh setup.sh && cd ..

# Setup OpenVPN
cd vpn/openvpn && sh setup.sh && cd ...

# Setup Kubevirt
cd kubevirt && sh setup.sh && cd ..

# Setup IRC
cd irc && sh setup.sh && cd ..

# Setup NextCloud (ingress/db issues with values yaml)
#cd nextcloud && sh setup.sh && cd ..

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

# Run Exit Nodes For Privacy Networks
# sh torexitnode/setup.sh
# sh gnunet/setup.sh
# sh i2p/setup.sh


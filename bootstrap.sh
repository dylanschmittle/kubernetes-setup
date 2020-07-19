#!/bin/sh

# Setup Ingress and Certs
cd ingress && sh setup.sh && cd ..

# Setup Mattermost
cd mattermost && sh setup.sh && cd ..

# Setup Jitsi
#cd jitsi && sh setup.sh && cd ..

# Setup Wireguard VPN
cd wireguard && setup.sh && cd ..

# sh irc-server/setup.sh
# sh irc-bouncer/setup.sh
# sh jitsi/setup.sh
# sh email/setup.sh
# sh nextcloud/setup.sh

# Setup VPN Teaming
# sh proton-vpn/setup.sh
# sh mulivad-vpn/setup.sh

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


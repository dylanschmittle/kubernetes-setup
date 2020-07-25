#!/bin/sh
RELEASE=myvpn
NAMESPACE=openvpn
./create-client-cert.sh laptop $NAMESPACE $RELEASE
./create-client-cert.sh desktop $NAMESPACE $RELEASE
./create-client-cert.sh phone $NAMESPACE $RELEASE
./create-client-cert.sh pinephone $NAMESPACE $RELEASE
./create-client-cert.sh tablet $NAMESPACE $RELEASE
./create-client-cert.sh rpi $NAMESPACE $RELEASE
./create-client-cert.sh guest1 $NAMESPACE $RELEASE
./create-client-cert.sh guest2 $NAMESPACE $RELEASE
mv *.ovpn ~/Keys
#!/bin/sh
mkdir /tmp/keys
cd /temp/keys
wg genkey | tee privateA.key | wg pubkey > publicA.key
wg genkey | tee privateB.key | wg pubkey > publicB.key
wg genkey | tee privateC.key | wg pubkey > publicC.key
chmod 0600 privateA.key

#!/bin/sh
git clone https://github.com/jitsi/docker-jitsi-meet
cd docker-jitsi-meet
cat env.example > .env
sh gen-passwords.sh
echo "set .env file values as needed"
echo "replace port envs in compose file with actual numbers from .env"
echo "then run convert.sh"

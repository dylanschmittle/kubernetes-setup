### Install Mattermost via Operators In kubernetes
[Stolen From](https://www.tauceti.blog/post/installing-mattermost-messaging-on-kubernetes/)
Change Hostname in mattermost.yaml and run setup.sh
TODO: Prompt for hostname in setup, and sed the mattermost file
TODO: Pull and Push images to Registry on Hosting Provider
This should be idempotent, change the files created by the setup script and run it again
To Fresh Install mattermost run reset.sh and then setup.sh, make changes to operator yaml and run setup.sh again to apply.



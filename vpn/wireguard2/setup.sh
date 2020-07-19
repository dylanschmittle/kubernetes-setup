git clone https://github.com/munnerz/kubewg.git
sudo sh -e "wg genkey | tee /etc/wireguard/privatekey | wg pubkey > /etc/wireguard/publickey"
cd kubewg
kustomize build ./config | kubectl apply -f -

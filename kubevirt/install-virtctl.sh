curl -L -o virtctl \
    https://github.com/kubevirt/kubevirt/releases/download/${KUBEVIRT_VERSION}/virtctl-${KUBEVIRT_VERSION}-linux-amd64
chmod +x virtctl
mv virtctl ~/.local/bin/virtctl
echo "Reload your shell so that virtctl is in the path"
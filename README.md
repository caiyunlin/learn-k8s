# learn-k8s
Learn Kubernetes

## Test on Play with K8S env 
- https://labs.play-with-k8s.com/

Note : use `Ctrl + Insert` key to Copy and `Shift + Insert` key to Paste.

1. Create two instances
2. On first instance execute following, it will pop up `kubeadm join` scripts
```bash
kubeadm init --apiserver-advertise-address $(hostname -i) --pod-network-cidr 10.5.0.0/16
kubectl apply -f https://raw.githubusercontent.com/cloudnativelabs/kube-router/master/daemonset/kubeadm-kuberouter.yaml
```
3. Copy `kubeadm join` and execute on second instance
```bash
kubeadm join 192.168.0.18:6443 --token prlt1h.1vylyoo4rpsrqcjb \
        --discovery-token-ca-cert-hash sha256:xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
```

4. Optionally deploy sample nginx deployment
```bash
kubectl apply -f https://raw.githubusercontent.com/kubernetes/website/master/content/en/examples/application/nginx-app.yaml
```

### Deploy hello-world nginx pod
```bash
# deploy nginx pod
kubectl apply -f https://raw.githubusercontent.com/caiyunlin/learn-k8s/refs/heads/main/src/01_nginx_pod.yaml

# query pods information, you should see the 'nginx-pod' is running
kubectl get pods 
```
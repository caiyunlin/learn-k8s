# learn-k8s
Learn Kubernetes


## Test on Play with K8S env 
- https://labs.play-with-k8s.com/

### Init
```bash
$scriptPath = "https://raw.githubusercontent.com/caiyunlin/learn-k8s/refs/heads/main/src"
```

### Deploy hello-world nginx pod
```bash
kubectl apply -f "$scriptPath/01_pod.yaml"
kubectl get pods # you should see the 'nginx-pod' running
```
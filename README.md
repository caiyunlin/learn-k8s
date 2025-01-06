# learn-k8s
Learn Kubernetes

## Test on Play with K8S env 
- https://labs.play-with-k8s.com/


### Deploy hello-world nginx pod
```bash
kubectl apply -f https://raw.githubusercontent.com/caiyunlin/learn-k8s/refs/heads/main/src/01_pod.yaml
kubectl get pods # you should see the 'nginx-pod' running
```
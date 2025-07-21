# deploy kubernetes resources

$scriptPath = "c:/work/github/learn-k8s/src"


# 01 - Deploy a Pod
kubectl apply -f "$scriptPath/01_nginx_pod.yaml"
kubectl get pods
kubectl delete pod nginx-pod 
kubectl get pods -o wide

# 02 - Deploy a Deployment
kubectl apply -f "$scriptPath/02_nginx_deployment.yaml"
kubectl get deployments # you should see the 'nginx-deployment' deployment with 3 replicas
kubectl get pods # you should see 3 pods running
kubectl delete deployment nginx-deployment

# 03 - Deploy a Service
kubectl apply -f "$scriptPath/03_nginx_service.yaml"
kubectl get services # you should see the 'nginx-service' running
kubectl delete service nginx-service
kubectl delete deployment nginx-deployment


# deploy kubernetes resources

# Set the current directory to the directory of the script
# $scriptPath = Split-Path -parent $MyInvocation.MyCommand.Definition
$scriptPath = "c:/work/github/learn-k8s/src"

# Start AKS Cluster
# az aks start -n myaks1203 -g aks-rg

# 01 - Deploy a Pod
kubectl apply -f "$scriptPath/01_pod.yaml"
kubectl get pods # you should see the 'nginx-pod' running
# kubectl delete pod nginx-pod 
# kubectl get pods -o wide

# 02 - Deploy a Deployment
kubectl apply -f "$scriptPath/02_nginx_deployment.yaml"
kubectl get pods # you should see the 'nginx-helloworld' running
# kubectl delete deployment hello-node

# 03 - Deploy a Service
kubectl apply -f "$scriptPath/03_nginx_service.yaml"
kubectl get services # you should see the 'nginx-service' running
# kubectl delete service nginx-service
# kubectl delete deployment nginx-deployment


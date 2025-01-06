# deploy kubernetes resources

# Set the current directory to the directory of the script
$scriptPath = Split-Path -parent $MyInvocation.MyCommand.Definition
# $scriptPath = "c:/work/github/learn-k8s/src"

# Play with K8S env : 
$scriptPath = "https://raw.githubusercontent.com/caiyunlin/learn-k8s/refs/heads/main/src"

kubectl apply -f "$scriptPath/01_pod.yaml"
kubectl get pods # you should see the 'nginx-pod' running

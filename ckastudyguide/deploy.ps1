# Manually create Pods
kubectl apply -f .\0201-manually-pod.yaml

kubectl get pods

kubectl delete pod manually-nginx-pod

# Create Deployments 
kubectl apply -f .\0202-nginx-deployment.yaml
kubectl get deployments

# Scale Deployment
kubectl scale deployment nginx-deployment --replicas=3


# update deployment for nginx version
kubectl apply -f .\0203-update-nginx-deployment.yaml
kubectl get deployments

kubectl delete deployment nginx-deployment


# Create StatefulSet
kubectl apply -f .\0204-stateful-deployment.yaml


## Config Map and Secrets
kubectl create configmap cm1 --from-literal=mykey=myvalue
kubectl get configmap cm1 -o yaml
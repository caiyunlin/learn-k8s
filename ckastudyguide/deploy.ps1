# Manually create Pods
kubectl apply -f .\0201-manually-pod.yaml

kubectl get pods

kubectl delete pod manually-nginx-pod


## Create Deployment via script
kubectl create deployment nginx-deployment --image=nginx:1.19.5 --replicas=6
kubectl describe deployment nginx-deployment # check the deployment details, including strategy, replicas, etc.
kubectl update deployment nginx-deployment 


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
kubectl create configmap mycm --from-literal=owner=calvin
kubectl get configmap mycm -o yaml
kubectl describe configmap mycm
kubectl delete configmap mycm
kubectl apply -f .\0208-exercise2-configmap.yaml

kubectl create secret generic mysecret --from-literal=dbuser="MyDatabaseUser" --from-literal=dbpassword="MyDatabasePassword" 
kubectl apply -f .\0209-exercise3-secret.yaml
kubectl logs nginx-secret | grep db
kubectl get secret mysecret -o yaml

# Kubernetes Namespaces - Imperative using kubectl
## Step-02: Namespaces Generic - Deploy in Dev1 and Dev2

```
kubectl create namespace dev1

kubectl create namespace dev2

kubectl get ns 
```
### Deploy All k8s Objects to default, dev1 and dev2 namespaces
```

kubectl apply -f kube-manifests/  
kubectl apply -f kube-manifests/ -n dev1
kubectl apply -f kube-manifests/ -n dev2

# List all objects
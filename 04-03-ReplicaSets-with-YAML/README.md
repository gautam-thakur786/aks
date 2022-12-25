# ReplicaSets with YAML

## Step-01: Create ReplicaSet Definition

# Create ReplicaSet
kubectl apply -f 02-replicaset-definition.yml

# List Replicasets
kubectl get rs

## Step-03: Create LoadBalancer Service for ReplicaSet
```
# Create LoadBalancer Service
kubectl apply -f 03-replicaset-LoadBalancer-servie.yml

# List LoadBalancer Service
kubectl get svc

# Access Application
http://<Load-Balancer-Service-IP>

```

## API References
- [ReplicaSet](https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.19/#replicaset-v1-apps)
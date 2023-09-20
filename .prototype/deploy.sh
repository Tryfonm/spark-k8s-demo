#!/bin/bash

# k3d cluster delete --all                                                       
# k3d cluster create --port 8082:30080@agent:0 -p 8081:80@loadbalancer --agents 1
# docker exec k3d-k3s-default-agent-0 mkdir -p /tmp/kube/spark-shared-volume
# docker exec k3d-k3s-default-agent-0 mkdir -p /tmp/kube/spark-event-logs
# docker exec k3d-k3s-default-agent-0 chmod 777 /tmp/kube/spark-shared-volume
# docker exec k3d-k3s-default-agent-0 chmod 777 /tmp/kube/spark-event-logs

kubectl apply -f manifests/namespace.yaml
kubectl apply -f manifests/persistentvolume.yaml
kubectl apply -f manifests/persistentvolumeclaim.yaml
kubectl apply -f manifests/nodeport-service.yaml
kubectl apply -f manifests/spark-master-deployment.yaml
kubectl apply -f manifests/spark-worker-deployment.yaml
kubectl apply -f manifests/spark-history-server-deployment.yaml
kubectl apply -f manifests/spark-app-deployment.yaml

# kubectl apply -f manifests/service.yaml

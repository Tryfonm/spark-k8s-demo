#!/bin/bash

k3d cluster delete --all                                                       
k3d cluster create --port 8082:30080@agent:0 -p 8081:80@loadbalancer --agents 1
docker exec k3d-k3s-default-agent-0 mkdir -p /tmp/kube/shared-spark          
docker exec k3d-k3s-default-agent-0 chmod 777 /tmp/kube/shared-spark
# docker exec k3d-k3s-default-agent-0 rm -rf /tmp/kube/shared-spark/my-spark-config

kubectl apply -f manifests/namespace.yaml
kubectl apply -f manifests/persistentvolume.yaml
kubectl apply -f manifests/persistentvolumeclaim.yaml
kubectl apply -f manifests/spark-master.yaml
kubectl apply -f manifests/spark-worker.yaml
kubectl apply -f manifests/spark-app.yaml
kubectl apply -f manifests/service.yaml

#!/bin/bash

k3d cluster create --port 8082:30080@agent:0 -p 8081:80@loadbalancer --agents 3
docker exec k3d-k3s-default-agent-0 mkdir -p /tmp/kube/spark-shared-volume
docker exec k3d-k3s-default-agent-0 mkdir -p /tmp/kube/spark-event-logs
docker exec k3d-k3s-default-agent-1 mkdir -p /tmp/kube/spark-shared-volume
docker exec k3d-k3s-default-agent-1 mkdir -p /tmp/kube/spark-event-logs
docker exec k3d-k3s-default-agent-2 mkdir -p /tmp/kube/spark-shared-volume
docker exec k3d-k3s-default-agent-2 mkdir -p /tmp/kube/spark-event-logs
# docker exec k3d-k3s-default-agent-0 chmod 777 /tmp/kube/spark-shared-volume
# docker exec k3d-k3s-default-agent-0 chmod 777 /tmp/kube/spark-event-logs

# -------------------------------------------------------- #

kubectl apply -f manifests/namespace.yaml
kubectl apply -f manifests/configmap.yaml
kubectl apply -f manifests/persistentvolume.yaml
kubectl apply -f manifests/persistentvolumeclaim.yaml

kubectl apply -f manifests/spark-master.yaml
kubectl apply -f manifests/spark-worker.yaml
kubectl apply -f manifests/spark-history-server.yaml
kubectl apply -f manifests/spark-driver.yaml
# git clone  https://raw.githubusercontent.com/kubernetes/dashboard/v2.7.0/aio/deploy/recommended.yaml

# -------------------------------------------------------- #

# (Optional) Add prometheus/grafana/loki for logging
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo add stable https://charts.helm.sh/stable
kubectl create namespace prometheus
helm install prometheus-community/kube-prometheus-stack --generate-name --namespace prometheus

helm repo add grafana https://grafana.github.io/helm-charts
helm repo update
kubectl create namespace loki-stack
helm upgrade --install loki --namespace=loki-stack grafana/loki-stack

# # After grafana reaches 'Running' state, run the following (screen -dmS prometheus ..):
# kubectl -n prometheus port-forward $(kpod -n prometheus --no-headers | grep grafana | awk '{print $1}') 3000
# Dont forget to add to source: http://loki.loki-stack:3100

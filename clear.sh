#!/bin/bash

docker exec k3d-k3s-default-agent-0 rm -rf /tmp/kube/shared-spark/my-spark-config

kubectl delete -f manifests/spark-master.yaml
kubectl delete -f manifests/spark-worker.yaml
kubectl delete -f manifests/spark-app.yaml
kubectl delete -f manifests/service.yaml

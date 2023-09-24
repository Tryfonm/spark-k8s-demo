#!/bin/bash

kubectl delete -f manifests/spark-master-deployment.yaml
kubectl delete -f manifests/spark-worker-deployment.yaml
kubectl delete -f manifests/spark-history-server-deployment.yaml
kubectl delete -f manifests/spark-app-deployment.yaml
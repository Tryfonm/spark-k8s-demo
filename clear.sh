#!/bin/bash

kubectl delete -f manifests/spark-driver.yaml
kubectl delete -f manifests/spark-worker.yaml
kubectl delete -f manifests/spark-master.yaml
kubectl delete -f manifests/spark-history-server.yaml
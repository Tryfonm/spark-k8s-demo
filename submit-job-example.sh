#!/bin/bash

SPARK_APP_POD=$(kubectl get pod --no-headers | grep spark-app | awk '{print $1}')

# Example running status_api_demo.py provided by spark
kubectl exec -it $SPARK_APP_POD -- sh -c \
'export $(cat /opt/spark/work-dir/shared-spark/my-spark-config) && \
/opt/spark/bin/spark-submit /opt/spark/examples/src/main/python/status_api_demo.py \
--master spark://$SPARK_MASTER:7077'

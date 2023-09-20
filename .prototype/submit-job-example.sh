#!/bin/bash


# Example running status_api_demo.py provided by spark
SPARK_APP_POD=$(kubectl get pod --no-headers | grep spark-master | awk '{print $1}')
JOB=''

kubectl exec -it $SPARK_APP_POD -- sh -c \
  'export $(cat /opt/spark/work-dir/shared-spark/my-spark-config) && \
  /opt/spark/bin/spark-submit /opt/spark/examples/src/main/python/status_api_demo.py \
  --master spark://$SPARK_MASTER:7077 \
  --conf spark.eventLog.enabled=true \
  --conf spark.eventLog.dir=/opt/spark/status_api_demo-event-logs'
#   /opt/spark/sbin/start-history-server.sh


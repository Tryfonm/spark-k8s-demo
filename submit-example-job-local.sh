#!/bin/bash

kubectl exec -it spark-driver-ss-0 -- sh -c \
    '/opt/spark/bin/spark-submit\
    --master spark://spark-master-svc:7077\
    --conf spark.eventLog.enabled=true\
    --conf spark.eventLog.dir=/opt/spark/event-logs/\
    /opt/spark/examples/src/main/python/status_api_demo.py'

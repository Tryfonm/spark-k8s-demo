#!/bin/bash

kubectl exec -it spark-driver-ss-0 -- sh -c \
    'apt install git -y && \
    rm -rf test-jenkins-spark-env/ && \
    git clone https://github.com/Tryfonm/test-jenkins-spark-env.git && \
    /opt/spark/bin/spark-submit \
    --master spark://spark-master-svc:7077 \
    --conf spark.eventLog.enabled=true \
    --conf spark.eventLog.dir=/opt/spark/event-logs/ \
    /opt/spark/workspace/test-jenkins-spark-env/syntheticData.py'

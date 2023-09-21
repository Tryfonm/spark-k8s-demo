## Project Name

### Introduction
This project deploys a Kubernetes cluster using k3d and sets up a Spark cluster with a master, worker nodes, and a driver. It also includes a bash script, `submit-example-job.sh`, which runs an existing example from the Apache Spark project.

### Prerequisites
Before you begin, ensure you have the following installed:
- [k3d](https://github.com/rancher/k3d): A lightweight wrapper for setting up K3s (a lightweight Kubernetes distribution).

### Getting Started
Run the deployment script to create the Kubernetes cluster and Spark components:
```
./deploy
```
The deployment script sets up a master, a specified number of worker nodes (you can adjust this in manifests/spark-worker.yaml by changing the replica value), and the Spark driver.
Logging is enabled and the logs are stored on k3d's agent-0 under `/tmp/kube/spark-event-logs` and mapped on a persistentvolume that is mounted under `/opt/spark/event-logs` for both the `driver`, that stores them and the `spark-history-server`, that parses the folder; the UI spark-history-server is exposed using cluster-ip as a service and an ingress, and can be accessed through `localhost:8081`
Use the provided submit-example-job.sh script to run an existing example provided by the Apache Spark project:
```
./submit-example-job.sh
```

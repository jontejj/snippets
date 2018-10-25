#!/bin/bash
#Depends on minikube / gcloud being started and configured
cd queue
kubectl create configmap example-redis-config --from-file=redis-config
kubectl create -f redis-pod.yaml

#kubectl create -f rabbitmq-service.yaml
#kubectl create -f rabbitmq-controller.yaml

cd worker
docker build -t job-wq-2 . -f DockerFile
docker tag job-wq-2 jontejj/job-wq-2
docker push jontejj/job-wq-2
kubectl create -f ./job.yaml


#Sidetrack
docker build . -f DockerFile

#or
kubectl run -i --tty temp --image ubuntu:14.04
    apt-get update
    apt-get install -y curl ca-certificates amqp-tools python dnsutils
#!/bin/bash
#Depends on minikube / gcloud being started and configured
#eval $(minikube docker-env)
cd queue
kubectl create configmap example-redis-config --from-file=redis-config
kubectl create -f redis-deployment.yaml -f redis-service.yaml

kubectl rollout status deployment redis-deployment

#kubectl create -f rabbitmq-service.yaml
#kubectl create -f rabbitmq-controller.yaml

cd ../worker
docker build -t job-wq-1:2 . -f DockerFile
#docker tag job-wq-2 jontejj/job-wq-2
#docker push jontejj/job-wq-2
kubectl create -f ./job.yaml

cd ../producer
docker build -t job-producer-1:2 . -f DockerFile
kubectl create -f ./producer-pod.yaml


#Sidetrack
#docker build . -f DockerFile

#or
#kubectl run -i --tty temp --image ubuntu:14.04
#    apt-get update
#    apt-get install -y curl ca-certificates amqp-tools python dnsutils
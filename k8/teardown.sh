#!/bin/sh
kubectl delete deployment redis-deployment
kubectl delete service redis
kubectl delete configmap example-redis-config
kubectl delete job job-producer-1
kubectl delete job job-wq-1
#!/bin/bash

echo "cleanup k8s resources"

kubectl delete -f microservice/deployment.yaml
kubectl delete -f devops


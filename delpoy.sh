#!/bin/bash

echo "Running building mooc microservice docker image by dockerfile.sh..."
./microservice/mooc-spring-java/dockerfile.sh

echo "Deploying docker devops infrastructure..."
kubectl apply -f devops

echo "Deploying mooc microservice deployment..."
kubectl apply -f microservice

echo "Forwarding for mooc-api-svc.."
kubectl kubectl port-forward -n mooc-uat svc/mooc-api-svc 8080:8080


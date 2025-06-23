#!/bin/bash

echo "Running building mooc microservice docker image by dockerfile.sh..."
./microservice/dockerfile.sh

echo "Deploying docker devops infrastructure..."
kubectl apply -f devops/mooc-uat-ns.yaml
kubectl apply -f devops

echo "Deploying mooc microservice deployment..."
kubectl apply -f microservice


# Wait until the pod is in the Ready state
while true; do
    POD_STATUS=$(kubectl get pods -n "mooc-uat" --no-headers | grep "mooc-api-")

    if echo "$POD_STATUS" | grep -q "1/1"; then
        echo "At least one pod matching 'mooc-api-*' is now Ready."
        break
    else
        echo "Waiting for pod matching 'mooc-api-*' to be Ready..."
        sleep 5
    fi
done

echo "Port Forwarding for mooc-api-svc.."
kubectl port-forward -n mooc-uat svc/mooc-api-svc 8080:8080


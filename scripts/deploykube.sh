#!/bin/bash

# echo "calling deployscript. Ensure project namespace and secret.yaml exist"
cd K8S
kubectl apply -f nginx-conf.yaml -n project
kubectl apply -f secret.yaml -n project
kubectl apply -f backend-app.yaml -f backend-cip.yaml -f flask-app.yaml -f flask-cip.yaml -f nginx.yaml -f nginx-lb.yaml
kubectl describe service/nginx-loadbalancer -n project
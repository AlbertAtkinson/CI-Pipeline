#!/bin/bash

cd kube
kubectl create ns pipeline
kubectl apply -f nginx-config.yaml -n pipeline
kubectl apply -f secret.yaml -n pipeline
kubectl apply -f backend.yaml -f frontend.yaml -f nginx.yaml
kubectl describe service/nginx-lb -n pipeline
#!/bin/sh
kubectl delete deployments,services,ingress,configmap,serviceaccount --all -n microservices-workshop

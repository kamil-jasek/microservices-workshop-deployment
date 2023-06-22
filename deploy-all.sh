#!/bin/sh
kubectl apply \
  -f postgres/service-account.yaml \
  -f postgres/deployment.yaml \
  -f postgres/service.yaml \
  -f mongodb/service-account.yaml \
  -f mongodb/configmap.yaml \
  -f mongodb/deployment.yaml \
  -f mongodb/service.yaml \
  -f kafka/deployment.yaml \
  -f kafka/service.yaml \
  -f prometheus/service-account.yaml \
  -f prometheus/cluster-role.yaml \
  -f prometheus/configmap.yaml \
  -f prometheus/deployment.yaml \
  -f prometheus/service.yaml \
  -f grafana/service-account.yaml \
  -f grafana/configmap.yaml \
  -f grafana/deployment.yaml \
  -f grafana/service.yaml

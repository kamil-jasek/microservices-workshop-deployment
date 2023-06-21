kubectl apply \
  -f postgres/service-account.yaml \
  -f postgres/deployment.yaml \
  -f postgres/service.yaml \
  -f mongodb/service-account.yaml \
  -f mongodb/configmap.yaml \
  -f mongodb/deployment.yaml \
  -f mongodb/service.yaml \
  -f kafka/deployment.yaml \
  -f kafka/service.yaml

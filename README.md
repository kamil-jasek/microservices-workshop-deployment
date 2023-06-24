# Workshop preparation

## 1. Clone next repositories:
1. [Orders microservice](https://github.com/kamil-jasek/microservices-workshop-orders)
2. [Warehouse microservice](https://github.com/kamil-jasek/microservices-workshop-warehouse)
3. [Customers microservice](https://github.com/kamil-jasek/microservices-workshop-customers)
4. [Order process manager microservice](https://github.com/kamil-jasek/microservices-workshop-order-process-manager)
5. [Orders Fronted microservice](https://github.com/kamil-jasek/microservices-workshop-orders-fronted)

## 2. Import them as existing modules into one project:
`File -> New -> Module from existing sources`

## 3. Go to orders microservice directory and run: 
`docker-compose up -d`

It will start containers like postgres, kafka and wiremock required to run locally orders microservice.

## 4. Go to customers microservice directory and run:
`docker-compose up -d`

It will start mongodb container required to run locally customers microservice.

## 5. Run from Intellij next microservices for Saga pattern:
1. Orders microservice with Spring profile: local
2. Customer microservice with Spring profile: local
3. Warehouse microservice with Spring profile: local

## 6. Install Quasar and run frontend app
How to install Quasar: [see here](https://quasar.dev/start/quasar-cli#tl-dr).<br>
Start frontend with command: `quasar dev`


## 7. Install and prepare minikube
1. [Installation](https://minikube.sigs.k8s.io/docs/start/)
2. For locally build docker images with microservices we need private registry in minikube. See [here](https://minikube.sigs.k8s.io/docs/handbook/registry/) how to install it.
3. Commands:
   1. `minikube start` - start kubernetes node
   2. `minikube dashboard` - start kubernetes dashboard in the browser
   3. `minikube tunnel` - open ingress to localhost
   4. `docker run --rm -it --network=host alpine ash -c "apk add socat && socat TCP-LISTEN:5000,reuseaddr,fork TCP:$(minikube ip):5000"` - redirect docker ports to minikube, it enables possibility for pushing images to minikube private registry.

## 8. Deploy microservices workshop to minikube
1. Go to deployments project and execute: `./deploy-all.sh`. It will install postrges, mongo, kafka, grafana, prometheus etc... everything what is needed before we deploy every microservice.
2. Go to every microservice directory and execute: `./deploy.sh` **WARNING** it's tested only on macOS, maybe you will need small adjustment for your OS. Check next point for deploying frontend.
3. Go to orders frontend directory and execute: `./deploy.sh v1` - it's needed to pass here some version.
4. If everything is fine, then open browser at: localhost:80 and test installation.

## 9. Install Linkerd on minikube
1. [Installation](https://linkerd.io/2.13/getting-started/)
2. [Install linkerd viz extension](https://linkerd.io/2.13/getting-started/#step-5-explore-linkerd)
3. Start dashboard: `linkerd viz dashboard &`

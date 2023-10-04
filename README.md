# Workshop Preparation

## 1. Clone Repositories
1. [Orders Microservice](https://github.com/kamil-jasek/microservices-workshop-orders)
2. [Warehouse Microservice](https://github.com/kamil-jasek/microservices-workshop-warehouse)
3. [Customers Microservice](https://github.com/kamil-jasek/microservices-workshop-customers)
4. [Order Process Manager Microservice](https://github.com/kamil-jasek/microservices-workshop-order-process-manager)
5. [Orders Frontend Microservice](https://github.com/kamil-jasek/microservices-workshop-orders-fronted)

## 2. Import All Projects into IntelliJ IDEA
There are two options to import projects:
1. You can import them as separate projects by using: `File -> New -> Project from Existing Sources`.
2. Or you can import them as modules: `File -> New -> Module from Existing Sources`.

Backend microservices require Java 17. Install it with this [instruction](https://www.jetbrains.com/help/idea/sdk.html).

## 3. Start Supporting Docker Services
1. Go to the `orders` project and execute: `docker-compose up -d`. This will start containers like PostgreSQL, Kafka, and Wiremock, which are required to run the orders microservice locally.
2. Go to the `customers` project and run: `docker-compose up -d`. This will start the MongoDB container required to run the customers microservice locally.

## 5. Run Microservices with 'local' Profile from IntelliJ IDEA

1. Go to the `order` project and find the class: `OrdersApplication`, then right-click on the class file name and select `More Run/Debug -> Modify Run Configuration`. If you are using IntelliJ Community Edition, then add the environment variable: `SPRING_PROFILES_ACTIVE=local`. If you are using Ultimate Edition, then add `local` to `Active Profiles`.
2. Repeat the above steps for the `customers` and `warehouse` microservices.

## 6. Install Quasar and Run Frontend App
Learn how to install Quasar [here](https://quasar.dev/start/quasar-cli#tl-dr).<br>
Start the frontend with the command: `quasar dev`

## 7. Install and Prepare Minikube
1. [Installation](https://minikube.sigs.k8s.io/docs/start/)
2. For locally built Docker images with microservices, we need a private registry in Minikube. See [here](https://minikube.sigs.k8s.io/docs/handbook/registry/) for instructions on how to install it.
3. Commands:
   1. `minikube start` - start the Kubernetes node.
   2. `minikube dashboard` - start the Kubernetes dashboard in the browser.
   3. `minikube tunnel` - open ingress to localhost.
   4. `docker run --rm -it --network=host alpine ash -c "apk add socat && socat TCP-LISTEN:5000,reuseaddr,fork TCP:$(minikube ip):5000"` - redirect Docker ports to Minikube, enabling the possibility of pushing images to the Minikube private registry.

## 8. Install Linkerd on Minikube
1. [Installation](https://linkerd.io/2.13/getting-started/)
2. [Install Linkerd Viz Extension](https://linkerd.io/2.13/getting-started/#step-5-explore-linkerd)
3. Start dashboard: `linkerd viz dashboard &`

## 9. (OPTIONAL STEP) Deploy Microservices Workshop to Minikube
1. Go to the `deployments` project and execute: `./deploy-all.sh`. This will install PostgreSQL, MongoDB, Kafka, Grafana, Prometheus, etc. - everything that is needed before we deploy every microservice.
2. Go to every microservice project and execute: `./deploy.sh` **WARNING** it's tested only on macOS, maybe you will need small adjustments for your OS. Check the next point for deploying the frontend.
3. Go to the `orders-frontend` project and execute: `./deploy.sh v1` - you need to pass a version here.
4. If everything is fine, then open a browser at: localhost:80 and test the installation.

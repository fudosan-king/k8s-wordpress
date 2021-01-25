## Setup k8s:
1. Install docker https://docs.docker.com/
2. Install minikube https://kubernetes.io/docs/tasks/tools/install-minikube/
3. Install VirtualBox use for minikube https://www.virtualbox.org/wiki/Linux_Downloads
> On MacOS brew install --cask virtualbox
4. Install kubectl https://kubernetes.io/docs/tasks/tools/install-kubectl/

## Run k8s
```
minikube config set driver virtualbox
minikube start
# Take the image previously built on docker:
eval $(minikube docker-env)
# Build docker
docker build -t wordpress-php8:latest .
# Enable the NGINX Ingress controller:
minikube addons enable ingress

kubectl create namespace wp
kubectl -n wp apply -f k8s/secret.yml
kubectl -n wp apply -f k8s/wp/.
kubectl -n wp apply -f k8s/mariadb/.

```
## Get nodes
```
kubectl -n nginx get nodes
```
## Get pod
```
kubectl -n nginx get pod
```
## Get service
```
kubectl -n nginx get svc
```
## Start kube dashboard

```
minikube dashboard
```

## Port forward from host to a pod
```
kubectl -n wp port-forward <pod_name> <port>:<target-port> 
```

## Database configuration
> https://github.com/fudosan-king/k8s-wordpress/blob/master/k8s/secret.yml
## Config wordpress volume hostpath
> https://github.com/fudosan-king/k8s-wordpress/blob/master/k8s/wp/pv-volume.yml#L13
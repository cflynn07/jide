JiDe
====

JiDe (記得), means "memorize" in Mandarin. This project is a web-based flashcard
application for memorizing Mandarin characters and their associated Pinyin.

This repo contains a golang service which provides a GraphQL API and a static
file server. The static file server serves a SPA web application that is built
with React.

Usage
-----
To run jide in a local development environment, you need docker and kubernetes.
I recommend installing docker-for-mac and enabling kubernetes.

To edit the service's code and see changes applied to containers in the
development environment we use `ksync`. Install from
[https://github.com/vapor-ware/ksync](https://github.com/vapor-ware/ksync)

```bash
git clone git@github.com:cflynn07/jide.git && cd ./jide
docker build . -t [YOUR-DOCKER-HUB-USERNAME]/jide
docker push [YOUR-DOCKER-HUB-USERNAME]/jide
```

Open `k8s-config.yaml` and replace all instances of `cflynnus` with your docker
hub username.  

Next, create the kubernetes objects from the `k8s-config.yaml` config file.
```bash
$ kubectl apply -f k8s-config.yaml
```

You should see:
```
namespace "jide" created
service "jide-api" created
deployment.apps "jide-api" created
```

Confirm pods started successfully by running `kubectl -n jide get pods`
```bash
$ kubectl -n jide get pods
NAME                        READY     STATUS    RESTARTS   AGE
jide-api-5c775d88dd-h6858   1/1       Running   0          2m
jide-api-5c775d88dd-swxjx   1/1       Running   0          2m
```

The application should be accessible in your browser at `http://localhost:3000`  

To edit the frontend or the API code and see the changes reflected in your
development environment, set up ksync.

```bash
$ ksync init
$ ksync watch & # Runs in background
$ ksync create -n jide --selector=app=jide $(pwd) /go/src/app # Now everytime a file is changed in your workdir ksync will replace the pods
```

#### Teardown
To shut down the development environment delete the kubernetes namespace
```bash
$ kubectl delete namespace jide
```

Verify cleanup is in progress by checking that the pods are terminating
```bash
-> % kubectl -n jide get pods
NAME                        READY     STATUS        RESTARTS   AGE
jide-api-7db54796fc-f56v7   1/1       Terminating   0          13m
jide-api-7db54796fc-l2slt   1/1       Terminating   0          13m
```

Tests
-----

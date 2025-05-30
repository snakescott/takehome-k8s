# takehome-k8s
Note: ran out of time for both gang scheduling and (sadly!) testing.


## Seeing in action
** These instructions are not safe for production**

Ensure the image defined by `Containerfile` is available in your k8s, e.g. via

```
minikube image build -t takehome-scheduler:latest .
```

(default minikube config seems to like a docker.io/ prefix, see the image field in scheduler.yaml).

Due to time contraints this has only been tested on a single node minikube in the default namespace, but it is intended to work on a arbitrary k8s installations in any namespace.

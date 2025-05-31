# takehome-k8s
Notes: 
1. Ran out of time for both gang scheduling and (sadly!) testing.
2. [custom-scheduler-v2](https://github.com/snakescott/custom-scheduler-v2) is a much cleaner implementation, but was built after/outside of the take-home time window (it has a [devlog](https://github.com/snakescott/custom-scheduler-v2/blob/main/devlog.md) detailing its development including when and how long it was worked on).


## Seeing in action
**These instructions are not safe for production**

Ensure the image defined by `Containerfile` is available in your k8s, e.g. via

```
minikube image build -t takehome-scheduler:latest .
```

(default minikube config seems to like a docker.io/ prefix, see the image field in scheduler.yaml).

Due to time contraints this has only been tested on a single node minikube in the default namespace, but it is intended to work on a arbitrary k8s installations in any namespace.

You can setup the scheduler using set_up_scheduler.bash. if an argument is passed to the script, it will be interpreted as a namespace and all k8s resources will be created there. Otherwise, default will be used.

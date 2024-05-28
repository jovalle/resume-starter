<div align="center">

<img src="./resume.jpeg" align="center" width="400px"/>

# Resume Starter

A starting point to Kubernetes

</div>

## 📋 Tasks

Kubernetes is trusted by enterprises across the world to host thousands of mission critical applications and services, many of which power the platforms you know and love. Why not trust it with your resume? As part of this workshop, we will:

- Deploy a highly-available web app ([Hugo](https://gohugo.io)) serving our resume ([tarrex/hugo-theme-online-resume](https://github.com/tarrex/hugo-theme-online-resume)) in a `Deployment`
- Configure the contents of the resume using a `ConfigMap` and reflect our changes readily using [Reloader](https://github.com/stakater/Reloader)
- View our finished product in the browser exposed by a `Service` and `Ingress` (powered by [Nginx](https://github.com/kubernetes/ingress-nginx))
- Generate web traffic and auto-scale the web app to multiple instances using a `HorizontalPodAutoscaler` (powered by [metrics-server](https://github.com/kubernetes-sigs/metrics-server))

## 🏁 Getting Started

Deploying Kubernetes is the hardest part. In my local environment, I settled with Docker Desktop's built-in Kubernetes cluster.

Alternatives include [kind](https://kind.sigs.k8s.io/) and [k3d](https://github.com/k3d-io/k3d)

Once installed, validate with `kubectl cluster-info` and start deploying with the included `Makefile`:

```sh
make deploy # to deploy kubernetes dependencies
make app    # to deploy our resume web app
make scale  # to deploy an HPA
make load   # to generate traffic to our web app and trigger the autoscaling
make top    # to show resource consumption
```

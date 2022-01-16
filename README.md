# complex

[![Build Status](https://app.travis-ci.com/santosh/k8s-poc.svg?branch=master)](https://app.travis-ci.com/santosh/k8s-poc)

`complex`, by the name indicates that it's a microservice rather than a monolith. This repo is a proof of concept that we can do microservices (aka multi-container) deployment to beanstalk and managed Kubernetes services like EKS.

We have a variety of containers running to serve this single application. These are:

1. A postgres instance. To store data.
2. A redis instance. For cache.
3. A worker instance. Worker takes request from application logic and makes calculation as a separate service; allowing the app to take next request without waiting
4. A frontend instance. For UI.
5. A backend instance. Application logic.

## Checkpoints

### v1.0.0

In this version of repo we did multi-container deployment to beanstalk. This version demonstrate GitHub -> Travis CI -> Elastic Beanstalk pipeline. See https://github.com/santosh/complex/blob/8d14a48633d1f861f74e545cad53dc20a932355e/.travis.yml to get a glimpse of that goes when any commit is push to GitHub.

### v2.0.0

In this version we did a minikube install on a local/dev environment.

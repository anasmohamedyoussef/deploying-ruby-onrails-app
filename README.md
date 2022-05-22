# deploying-ruby-onrails-app

This the Readme file for the instruction of deploying drkiq ruby application on a kuebernetes cluster.
 the [blog](https://semaphoreci.com/community/tutorials/dockerizing-a-ruby-on-rails-application) that i followed was written by Nick Janetakis, This repo holds the kubernetes objects recquired to run the application on a kubernetes cluster, This cluster is built on Minikube on windows OS.

 # Prerequisites:
 * [Minikube](https://minikube.sigs.k8s.io/docs/start/)
 * [Docker](https://docs.docker.com/get-docker/)
 * (Optional)Kubectl on [Windows](https://kubernetes.io/docs/tasks/tools/install-kubectl-windows/) or [Linux](https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/)


Minikube is a cluster that can be used locally and very easy to setup, the cluster consists of one master node and one slave node, not useful for production level but very useful in testing.

 After the download we can use this command from the Terminal:
```bash
minikube start
```


## The procedure of deploying the application:
* 1) Followed the blog to create the image and push it to docker hub's personal account
* 2) Created the configmap objects to hold the data replacing the .env file
* 3) craeted the deployment,service,pv and pvc of redis and postgresql, integrating the configmaps  along with postgres, to cache and srtore the drkiq app data.
* 4) craeting the deployments, for drkiq and sidekiq and service for drkiq with excuting rake commands on startup, sidekiq is created to replace unicorn.rb when unicorn command fails.
* 5) Created the nginx objects are created in order to reverse the proxy of the drkiq application.
* 6) Created a simple provisioning script to startup the kubernetes objects.



##Future plans:
* Resolve bugs 
* Add token and password to secrets object.
* Create a delete objects script.
* Update the docker image to excute the rake commands instead of the deployment
* Loadbalance with ingress-controller contour and ingress objects

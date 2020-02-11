# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

push

```
IMAGE_ID=$(docker build -f Dockerfile.prod -q -t foo .)
reg_url="asia.gcr.io/sixth-clone-267906/docker-image"
docker tag ${IMAGE_ID} ${reg_url}
docker -- push ${reg_url}
kubectl delete -f deployment.yaml
kubectl create -f deployment.yaml
kubectl get pod
kubectl logs
```
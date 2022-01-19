kubectl apply -f k8s

kubectl set image deployments/server-deployment server=sntshk/complex-server:$SHA
kubectl set image deployments/client-deployment client=sntshk/complex-client:$SHA
kubectl set image deployments/worker-deployment worker=sntshk/complex-worker:$SHA

#!/bin/bash -e

images='client server worker'

for image in $images
do
    # using it as there will be 2 versions published
    TARGET_IMAGE="sntshk/complex-$image"
    # lets make sure we always have access to latest image
    TARGET_IMAGE_LATEST="${TARGET_IMAGE}:latest"

    # using specific version as well
    TARGET_IMAGE_VERSIONED="${TARGET_IMAGE}:$SHA"

    # Push image to Docker Hub
    # update latest version
    docker tag ${TARGET_IMAGE} ${TARGET_IMAGE_LATEST}
    docker push ${TARGET_IMAGE_LATEST}

    # push new version
    docker tag ${TARGET_IMAGE} ${TARGET_IMAGE_VERSIONED}
    docker push ${TARGET_IMAGE_VERSIONED}

    # echo ${TARGET_IMAGE_LATEST} --- ${TARGET_IMAGE_VERSIONED}
done

kubectl apply -f k8s

kubectl set image deployments/server-deployment server=sntshk/complex-server:$SHA
kubectl set image deployments/client-deployment client=sntshk/complex-client:$SHA
kubectl set image deployments/worker-deployment worker=sntshk/complex-worker:$SHA

#!/bin/bash

ECR_REGISTRY=$1  # pass registry as argument
APP="frontend backend"

for SERVICE in $APP; do
    echo "Pulling latest image for $SERVICE..."
    docker pull $ECR_REGISTRY/ticketmaster-$SERVICE:latest
done

echo "Stopping old containers..."
docker ps -q --filter "name=ticketmaster" | xargs -r docker stop
docker ps -a -q --filter "name=ticketmaster" | xargs -r docker rm

echo "Starting new containers..."
docker run -d --name ticketmaster-frontend -p 80:80 $ECR_REGISTRY/ticketmaster-frontend:latest
docker run -d --name ticketmaster-backend -p 3000:3000 $ECR_REGISTRY/ticketmaster-backend:latest

#! /bin/bash
cd frontend
sudo docker build -t aatkinson42/front-end .
cd ..
cd backend
sudo docker build -t aatkinson42/back-end .
cd ..
sudo docker login --username={DOCKER_USER} --password={DOCKER_PASS}
sudo docker push aatkinson42/back-end
sudo docker push aatkinson42/front-end
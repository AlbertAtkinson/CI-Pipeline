#! /bin/bash

ssh ubuntu@${TEST_IP}
git clone https://github.com/AAtkinsonQA/CI-Pipeline.git
cd CI-Pipeline
docker-compose up -d
echo "Running Tests: "
sudo docker exec frontend bash -c "pytest tests/ --cov application"
sudo docker exec backend bash -c "pytest tests/ --cov application"
docker-compose down
cd ..
rm -rf CI-Pipeline
ls
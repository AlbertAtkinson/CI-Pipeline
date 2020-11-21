#! /bin/bash

git clone --branch jenkinstest https://github.com/AAtkinsonQA/CI-Pipeline.git
cd CI-Pipeline
sudo -E TEST_DATABASE_URI=${TEST_DATABASE_URI} -E SECRET_KEY=${SECRET_KEY} docker-compose up -d
echo "Running Tests: "
sudo docker exec frontend bash -c "pytest tests/ --cov application"
sudo docker exec backend bash -c "pytest tests/ --cov application"
sudo docker-compose down
cd ..
rm -rf CI-Pipeline
ls
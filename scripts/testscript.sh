#! /bin/bash

sudo rm -r CI-Pipeline
git clone --branch testconf https://github.com/AAtkinsonQA/CI-Pipeline.git
cd CI-Pipeline
mysql -h k8s-rds.cbf9oalhjjnm.eu-west-1.rds.amazonaws.com -P 3306 -u root -ppass5678 < database/Create.sql
mysql -h test-rds.cbf9oalhjjnm.eu-west-1.rds.amazonaws.com -P 3306 -u root -ppass1234 < database/Create.sql
sudo docker-compose up -d --build
echo "Running Tests: "
sudo docker exec frontend bash -c "pytest tests/ --cov application"
sudo docker exec backend bash -c "pytest tests/ --cov application"
sudo docker-compose down
cd ..
ls
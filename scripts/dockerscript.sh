if ! [which docker > /dev/null]
then
  sudo apt update
  sudo apt install -y curl jq
  curl https://get.docker.com | sudo bash
fi

if ! [which docker-compose > /dev/null]
then
  sudo curl -L "https://github.com/docker/compose/releases/download/1.26.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
  sudo chmod +x /usr/local/bin/docker-compose
fi 

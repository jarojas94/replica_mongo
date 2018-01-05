docker-compose down -v --rmi local
sudo rm -rf ~/Apps/replica1_local_docker/logs
sudo rm -rf ~/Apps/replica1_local_docker/data
docker-compose up --build -d

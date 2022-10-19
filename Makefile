
LOGIN=psaulnie
ENV_PATH=./srcs/.env
DOCKER_COMPOSE_PATH= ./srcs/docker-compose.yml

all: folders
	docker-compose --env-file ${ENV_PATH} -f ${DOCKER_COMPOSE_PATH} up -d --build

folders:
	sudo mkdir -p /home/${LOGIN}/data
	sudo mkdir -p /home/${LOGIN}/data/mariadb
	sudo mkdir -p /home/${LOGIN}/data/wordpress

clean:
	docker-compose --env-file ${ENV_PATH} -f ${DOCKER_COMPOSE_PATH} down
	docker volume rm `docker volume ls -q`

fclean: clean
	docker system prune -af
	sudo rm -rf /home/${LOGIN}/data/

re: clean all


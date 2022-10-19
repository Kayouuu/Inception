# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: psaulnie <psaulnie@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/10/20 12:17:01 by psaulnie          #+#    #+#              #
#    Updated: 2022/10/20 12:17:01 by psaulnie         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

LOGIN=psaulnie
DOCKER_COMPOSE_PATH= ./srcs/docker-compose.yml

all: folders
	docker-compose -f ${DOCKER_COMPOSE_PATH} up -d --build

folders:
	sudo mkdir -p /home/${LOGIN}/data
	sudo mkdir -p /home/${LOGIN}/data/mariadb
	sudo mkdir -p /home/${LOGIN}/data/wordpress

clean:
	-docker stop `docker ps -qa` 2> /dev/null
	-docker rm `docker ps -qa` 2> /dev/null
	-docker rmi -f `docker images -qa` 2> /dev/null
	-docker volume rm `docker volume ls -q` 2> /dev/null
	-docker network rm `docker network ls -q` 2> /dev/null

re: clean all

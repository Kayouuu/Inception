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
	docker-compose -f ${DOCKER_COMPOSE_PATH} down
	docker volume rm `docker volume ls -q`

fclean: clean
	docker system prune -af
	sudo rm -rf /home/${LOGIN}/data/

re: clean all


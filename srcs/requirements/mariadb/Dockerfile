FROM debian:buster
# Container will listen from port 3306
EXPOSE 3306

RUN apt-get update -y && apt-get install -y mariadb-server

RUN sed -i 's/bind-address/# bind-address#/i' /etc/mysql/mariadb.conf.d/50-server.cnf

RUN /etc/init.d/mysql start

COPY ./tools/start.sh ./start.sh
RUN	 chmod +x ./start.sh

ENTRYPOINT [ "./start.sh" ]

CMD [ "/usr/bin/mysqld_safe" ]
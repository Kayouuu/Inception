#! /bin/sh
# CURRENTLY UNUSED

exec /usr/bin/mysqld_safe
mysql -u root -e "CREATE DATABASE IF NOT EXISTS ${DB_NAME}; \
CREATE USER ${MYSQL_USER}@localhost IDENTIFIED BY '${MYSQL_PASSWORD}'; \
GRANT ALL ON wordpress.* TO ${MYSQL_USER}@localhost; \
FLUSH PRIVILEGES; \
ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';"

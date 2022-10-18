#!/bin/sh
# CURRENTLY UNUSED

if [ -f ./wordpress/wp-config.php ]
then
	echo "Already installed";
else
	cd /var/www/html/
	sed -i "s/votre_utilisateur_de_bdd/$MYSQL_USER/g" wp-config-sample.php
	sed -i "s/votre_mdp_de_bdd/$MYSQL_PASSWORD/g" wp-config-sample.php
	sed -i "s/localhost/mariadb/g" wp-config-sample.php
	sed -i "s/votre_nom_de_bdd/$DB_NAME/g" wp-config-sample.php
	cp wp-config-sample.php wp-config.php
fi

exec /usr/sbin/php-fpm7.3 -F
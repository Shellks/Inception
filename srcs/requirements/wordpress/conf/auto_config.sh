#!//bin/bash

sleep 5;

config_file="var/www/wordpress/wp-config.php"

if [ -e "$config_file" ];
then
	echo "wp-config.php already exist."
else
	wp config create	--allow-root \
						--dbname=${MYSQL_DATABASE} \
						--dbuser=${MYSQL_USER} \
						--dbpass=${MYSQL_PASSWORD} \
						--dbhost=mariadb:3306 --path='/var/www/wordpress'
	wp core install		--allow-root \
						--title=${WP_TITLE} \
						--admin_user=${ADMIN_USERNAME} \
						--admin_password=${ADMIN_PASSWORD} \
						--admin_email=${ADMIN_EMAIL}\
						--skip-email
	wp user create		Elon Elon@user.com \
						--user_pass=${USER_PASSWORD} \
						--porcelain \
						--allow-root
fi
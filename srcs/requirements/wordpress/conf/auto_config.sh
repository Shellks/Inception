#!//bin/bash

sleep 5;

config_file="var/www/wordpress/wp-config.php"

if [ -e "$config_file" ];
then
	echo "wp-config.php already exist."
else
	wp-cli.phar core download	--allow-root \
								--path='/var/www/wordpress'

	wp-cli.phar config create	--allow-root \
								--dbname=${MYSQL_DATABASE} \
								--dbuser=${MYSQL_USER} \
								--dbpass=${MYSQL_PASSWORD} \
								--dbhost=mariadb:3306 \
								--path='/var/www/wordpress'
	wp-cli.phar core install	--allow-root \
								--url=${DOMAIN_NAME} \
								--title=${WP_TITLE} \
								--admin_user=${ADMIN_USERNAME} \
								--admin_password=${ADMIN_PASSWORD} \
								--admin_email=${ADMIN_EMAIL}\
								--skip-email \
								--path='/var/www/wordpress'
	wp-cli.phar user create		Elon Elon@user.com \
								--user_pass=${USER_PASSWORD} \
								--porcelain \
								--allow-root \
								--path='/var/www/wordpress'
fi

chown -R www-data:www-data /var/www/wordpress
php-fpm7.4 -F

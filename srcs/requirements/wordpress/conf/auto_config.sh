#!//bin/bash

sleep 5;

# assigns the path to the WordPress configuration file
config_file="var/www/wordpress/wp-config.php"

# checks if the WordPress configuration file already exists
if [ -e "$config_file" ];
then
	echo "wp-config.php already exist."
else
	# downloads the WordPress core files to the specified path
	wp-cli.phar core download	--allow-root \
								--path='/var/www/wordpress'

	# creates a WordPress configuration file with the specified database details
	wp-cli.phar config create	--allow-root \
								--dbname=${MYSQL_DATABASE} \
								--dbuser=${MYSQL_USER} \
								--dbpass=${MYSQL_PASSWORD} \
								--dbhost=mariadb:3306 \
								--path='/var/www/wordpress'
	# installs WordPress with the provided settings
	wp-cli.phar core install	--allow-root \
								--url=${DOMAIN_NAME} \
								--title=${WP_TITLE} \
								--admin_user=${ADMIN_USERNAME} \
								--admin_password=${ADMIN_PASSWORD} \
								--admin_email=${ADMIN_EMAIL}\
								--skip-email \
								--path='/var/www/wordpress'
	# creates a new WordPress user with the provided settings
	wp-cli.phar user create		Elon Elon@user.com \
								--user_pass=${USER_PASSWORD} \
								--porcelain \
								--allow-root \
								--path='/var/www/wordpress'
fi
# changes the ownership of the WordPress directory to www-data
# which is the user and group that the PHP-FPM service runs as
chown -R www-data:www-data /var/www/wordpress
php-fpm7.4 -F

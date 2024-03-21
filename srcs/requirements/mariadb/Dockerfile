# base image to use
FROM debian:bullseye

# declares arguments which will be used later
ARG	MYSQL_DATABASE
ARG	MYSQL_USER
ARG	MYSQL_PASSWORD
ARG	MYSQL_ROOT_PASSWORD

# updates the package lists for the Debian operating system
# and upgrades all installed packages to their latest versions
RUN apt update -y && apt upgrade -y
RUN apt install mariadb-server -y

# starts the MariaDB service and executes MariaDB commands to initialize the database
RUN	service mariadb start \
	&& mariadb -u root \
	-e "CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE};" \
	-e "CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'localhost' IDENTIFIED BY '${MYSQL_PASSWORD}';" \
	-e "GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';" \
	-e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';" \
	-e "FLUSH PRIVILEGES;"
# reloads the privileges changes made by the previous commands take effect

# execute the mariadbd command with the --bind-address=0.0.0.0 argument
# which binds the MariaDB server to listen on all network interfaces
ENTRYPOINT ["mariadbd", "--bind-address=0.0.0.0"]

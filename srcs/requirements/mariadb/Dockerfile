FROM debian:bullseye

RUN apt update -y && apt upgrade -y
RUN apt install mariadb-server -y

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

RUN	service mariadb start \
	&& mariadb -e "CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE}\`;" \
	&& mariadb -e "CREATE USER IF NOT EXISTS \`${MYSQL_USER}\`@'localhost' IDENTIFIED BY '${MYSQL_PASSWORD}';" \
	&& mariadb -e "GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE}\`.* TO \`${MYSQL_USER}\`@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';" \
	&& mariadb -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';" \
	&& mariadb -e "FLUSH PRIVILEGES;"

ENTRYPOINT ["mariadbd", "--bind-address=0.0.0.0"]
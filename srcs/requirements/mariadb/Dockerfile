FROM debian:buster

RUN apt update -y && apt upgrade -y
RUN apt install mariadb-server -y

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

RUN	service mysql start \
	&& mysql -e "CREATE DATABASE IF NOT EXISTS \`ALEXDB\`;" \
	&& mysql -e "CREATE USER IF NOT EXISTS \`ALEX\`@'localhost' IDENTIFIED BY 'ALEX_PASSWORD';" \
	&& mysql -e "GRANT ALL PRIVILEGES ON \`ALEXDB\`.* TO \`ALEX\`@'%' IDENTIFIED BY 'ALEX_PASSWORD';" \
	&& mysql -e "FLUSH PRIVILEGES;"

ENTRYPOINT ["mysqld", "--bind-address=0.0.0.0"]
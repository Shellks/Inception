# base image to use
FROM	debian:bullseye

# declares argument which will be used later
ARG	CERTS_

RUN		apt update -y && apt upgrade -y \
		&& apt install vim -y \
		&& apt install curl -y \
		&& apt install nginx -y \
		&& mkdir -p /etc/nginx/ssl \
		&& apt install openssl -y

# generates SSL certificates
RUN		openssl req -x509 -nodes -out /etc/nginx/ssl/acarlott.crt -keyout /etc/nginx/ssl/acarlott.key -subj "${CERTS_}"

# create a directory where nginx will store its runtime files
RUN		mkdir -p /var/run/nginx

# copies the nginx configuration file into the container
COPY	conf/nginx.conf /etc/nginx/conf.d/acarlott.conf

# sets the permissions (directory commonly used to serve web content in nginx)
RUN		chmod 755 /var/www/html

# starts the nginx server, option prevents nginx from running as a background daemon
CMD		[ "nginx", "-g", "daemon off;" ]

FROM	debian:buster

RUN		apt update -y && apt upgrade -y && \
		apt install vim -y && apt install curl -y && apt install nginx -y && \
		mkdir -p /etc/nginx/ssl && apt install openssl -y
RUN		openssl req -x509 -nodes -out /etc/nginx/ssl/acarlott.crt -keyout /etc/nginx/ssl/acarlott.key -subj "/C=FR/ST=RA/L=Lyon/O=42/OU=42/CN=acarlott.42.fr/UID=acarlott"
RUN		mkdir -p /var/run/nginx

COPY	conf/nginx.conf /etc/nginx/nginx.conf

RUN		chmod 755 /var/www/html

CMD		[ "nginx", "-g", "daemon off;" ]
# base image to use
FROM debian:bullseye

RUN	apt-get update \
	&& apt-get upgrade -y \
	&& apt-get -y install wget

# installs PHP and its modules
RUN	apt-get install -y php-fpm php-mysql

COPY conf/www.conf /etc/php/7.4/fpm/pool.d/

# downloads the WordPress Command Line Interface (WP-CLI) tool
# makes it executable with `chmod +x`
# moves it to `/usr/local/bin/` so it can be executed from anywhere in the command line
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
	&& chmod +x wp-cli.phar \
	&& mv wp-cli.phar /usr/local/bin/

COPY conf/auto_config.sh /

# create /run/php Without this directory
# PHP-FPM can't create the socket files required for communication with the web server.
RUN mkdir /run/php \
	&& chmod +x /auto_config.sh

CMD ["/auto_config.sh"]

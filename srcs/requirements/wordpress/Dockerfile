FROM debian:bullseye

RUN	apt-get update \
	&& apt-get upgrade -y \
	&& apt-get -y install wget

RUN	apt-get install -y php\
	php-fpm\
	php-mysql\
	mariadb-client

# RUN	wget https://fr.wordpress.org/wordpress-6.4.3-fr_FR.tar.gz -P /var/www \
# 	&& cd /var/www && tar -xzf wordpress-6.4.3-fr_FR.tar.gz \
# 	&& rm wordpress-6.4.3-fr_FR.tar.gz \

COPY conf/www.conf /etc/php/7.4/fpm/pool.d/

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
	&& chmod +x wp-cli.phar \
	&& mv wp-cli.phar /usr/local/bin/

COPY conf/auto_config.sh /

RUN mkdir /run/php \
	&& chmod +x /auto_config.sh

CMD ["/auto_config.sh"]

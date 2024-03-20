# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: acarlott <acarlott@student.42lyon.fr>      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/03/19 10:33:18 by acarlott          #+#    #+#              #
#    Updated: 2024/03/21 00:29:46 by acarlott         ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

NAME = Inception

DOC_FILE = srcs/docker-compose.yml
MARIADB_VOL = /home/acarlott/data/mariadb/
WORDPRESS_VOL = /home/acarlott/data/wordpress/

all: $(NAME)

$(NAME):
	docker compose -f $(DOC_FILE) up --build -d

down:
	docker compose -f $(DOC_FILE) down

clean:
	docker compose -f $(DOC_FILE) down --volumes --remove-orphans --rmi all

fclean: clean
	docker system prune --force --all
	sudo rm -rf $(MARIADB_VOL)*
	sudo rm -rf $(WORDPRESS_VOL)*

re: fclean all

.SILENT:

.PHONY: all down clean fclean re

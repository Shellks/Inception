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

DOC_FILE = srcs/docker-compose.yml
DB_PATH = /home/acarlott/data

all:
	mkdir -p  $(DB_PATH)/mariadb $(DB_PATH)/wordpress
	docker compose -f $(DOC_FILE) up --build -d

down:
	docker compose -f $(DOC_FILE) down

clean:
	docker compose -f $(DOC_FILE) down --volumes --rmi all

fclean: clean
	docker system prune --force --all
	sudo rm -rf $(DB_PATH)

re: fclean all

.PHONY: all down clean fclean re

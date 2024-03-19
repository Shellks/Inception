# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: acarlott <acarlott@student.42lyon.fr>      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/03/19 10:33:18 by acarlott          #+#    #+#              #
#    Updated: 2024/03/19 12:56:40 by acarlott         ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

NAME = Inception

SRCS = srcs/
DOC_FILE = $(SRCS)docker-compose.yml

all: $(NAME)

$(NAME):
	docker-compose -f srcs/docker-compose.yml up --build

down:
	docker-compose -f $(DOC_FILE) down

clean:
	docker-compose -f $(DOC_FILE) down --volumes --remove-orphans --rmi all

fclean: clean
	docker system prune --force --all

re: clean all

# .SILENT:

.PHONY: all down clean fclean re
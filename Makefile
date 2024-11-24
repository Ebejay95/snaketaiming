# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: joeberle <joeberle@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/11/18 20:50:49 by joeberle          #+#    #+#              #
#    Updated: 2024/11/19 10:03:01 by joeberle         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: joeberle <joeberle@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/11/18 20:50:49 by joeberle          #+#    #+#              #
#    Updated: 2024/11/18 20:56:34 by joeberle         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#------------------------------------------------------------------------------#
#--------------                       PRINT                       -------------#
#------------------------------------------------------------------------------#

BLACK := \033[90m
RED := \033[31m
GREEN := \033[32m
YELLOW := \033[33m
BLUE := \033[34m
MAGENTA := \033[35m
CYAN := \033[36m
X := \033[0m

SUCCESS := \n\
$(BLUE)████████████████████████████████████████████████████$(X)\n\
$(X)\n\
███████  ███████           ███████  ███████  ███████$(X)\n\
█           █              █     █     █     █     █$(X)\n\
███████     █              █     █     █     ███████$(X)\n\
█           █              █     █     █     █      $(X)\n\
█           █     ███████  ███████     █     █      $(X)\n\
$(X)\n\
$(BLUE)████████████████████████████████████████████████████$(X)\n\

#------------------------------------------------------------------------------#
#--------------                      GENERAL                      -------------#
#------------------------------------------------------------------------------#

NAME		= ft_otp
PYTHON		= python3
PIP			= pip3
PYINSTALLER	= pyinstaller
SRC			= ft_otp.py

#------------------------------------------------------------------------------#
#--------------                       FLAGS                       -------------#
#------------------------------------------------------------------------------#

PYFLAGS     = --onefile --hidden-import=PIL
PIPFLAGS	= install

#------------------------------------------------------------------------------#
#--------------                        DIR                        -------------#
#------------------------------------------------------------------------------#

BUILD_DIR	= build
DIST_DIR	= dist

#------------------------------------------------------------------------------#
#--------------                      DEPENDS                      -------------#
#------------------------------------------------------------------------------#

DEPENDS		= colorama

#------------------------------------------------------------------------------#
#--------------                      COMPILE                      -------------#
#------------------------------------------------------------------------------#

.PHONY: all setup clean fclean re

all: setup $(NAME)

setup:
	@echo "$(BLUE)Installing dependencies...$(X)"
	@$(PIP) $(PIPFLAGS) $(DEPENDS)

$(NAME): $(SRC)
	$(PIP) install pyinstaller
	@if [ ! -f $(NAME) ] || [ $(SRC) -nt $(NAME) ]; then \
		echo "$(YELLOW)Building binary...$(X)"; \
		$(PYINSTALLER) $(PYFLAGS) $(SRC); \
		mv $(DIST_DIR)/$(NAME) .; \
		echo "$(GREEN)Binary created: ./$(NAME)$(X)"; \
		echo "$(SUCCESS)"; \
	else \
		echo "$(GREEN)Binary is up to date$(X)"; \
	fi

clean:
	@echo "$(RED)Cleaning build files...$(X)"
	@rm -rf $(BUILD_DIR) $(DIST_DIR) *.spec __pycache__ 2>/dev/null || true

fclean: clean
	@echo "$(RED)Full cleanup...$(X)"
	@rm -f $(NAME) 2>/dev/null || true

re: fclean all
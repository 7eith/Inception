ifeq (,$(shell grep amonteli /etc/hosts))
_ := $(shell sudo bash -c '/bin/echo "127.0.0.1 amonteli.42.fr" >> /etc/hosts')
endif

SRC=srcs/docker-compose.yml

COMMAND=docker-compose

all: run

run: 
	$(COMMAND) -f $(SRC) up --build

detach: 
	$(COMMAND) -f $(SRC) up -d --build

ps:
	$(COMMAND) -f $(SRC) ps

top:
	$(COMMAND) -f $(SRC) top

fclean:
	$(COMMAND) -f $(SRC) down --rmi all -v

.PHONY: run detach ps top fclean 
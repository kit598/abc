COLOR_RESET	=	\033[0m
GREEN		=	\033[32m
YELLOW		=	\033[33m
BLUE		=	\033[34m
RED			=	\033[31m
CYAN		= 	\033[1;36m


CC			=	c++
# CFLAGS		=	-Wall -Werror -Wextra 
CFLAGS		=	-Wall -Werror -Wextra -std=c++98 -pedantic

#########################################################
NAME		=	Server

HEADER		=	./include/ConfigParser.hpp \
				./include/HttpRequest.hpp \
				./include/RouteConfig.hpp \
				./include/ServerConfig.hpp \
				./include/Connection.hpp \
				./include/ConnectionManager.hpp\
				./include/Server.hpp 


SRC_FILES	=	./src/main.cpp \
				./src/Run_server/HttpRequest.cpp \
				./src/Run_server/ConfigParser.cpp \
				./include/Connection.cpp \
				./src/Set_server/RouteConfig.cpp \
				./src/Set_server/ServerConfig.cpp \
				./src/Set_server/Server.cpp \
				./src/Run_server/ConnectionManager.cpp




FOLDER_1	=	Response
FOLDER_2	=	Run_server
FOLDER_3	=	Set_server
FOLDER_4	=	

PORT 		= 	9091
HOST 		= 	localhost
CONFIG		=	config/kit.conf

#########################################################
OBJ_DIR		=	obj
OBJ_FILES   = $(notdir $(SRC_FILES:.cpp=.o))         
OBJ_TARGETS = $(addprefix $(OBJ_DIR)/, $(OBJ_FILES))  

all: $(NAME)  

$(NAME): $(OBJ_TARGETS) $(HEADER) Makefile
	$(CC) $(CFLAGS) $(OBJ_TARGETS) -o $@
	@echo "$(YELLOW)✅ make all finish$(COLOR_RESET)"


$(OBJ_DIR)/%.o: %.cpp $(HEADER) Makefile
	@mkdir -p $(OBJ_DIR)
	$(CC) $(CFLAGS) -Iinclude -c $< -o $@

# สำหรับ FOLDER SRC
$(OBJ_DIR)/%.o: src/%.cpp $(HEADER)
	@mkdir -p $(OBJ_DIR)
	$(CC) $(CFLAGS) -Iinclude -c $< -o $@

# สำหรับ FOLDER_1/
$(OBJ_DIR)/%.o: src/$(FOLDER_1)/%.cpp $(HEADER)
	@mkdir -p $(OBJ_DIR)
	$(CC) $(CFLAGS) -Iinclude -c $< -o $@

# สำหรับ FOLDER_2/
$(OBJ_DIR)/%.o: src/$(FOLDER_2)/%.cpp $(HEADER)
	@mkdir -p $(OBJ_DIR)
	$(CC) $(CFLAGS) -Iinclude -c $< -o $@

# สำหรับ FOLDER_3/
$(OBJ_DIR)/%.o: src/$(FOLDER_3)/%.cpp $(HEADER)
	@mkdir -p $(OBJ_DIR)
	$(CC) $(CFLAGS) -Iinclude -c $< -o $@

# สำหรับ FOLDER_4/
$(OBJ_DIR)/%.o: src/$(FOLDER_4)/%.cpp $(HEADER)
	@mkdir -p $(OBJ_DIR)
	$(CC) $(CFLAGS) -Iinclude -c $< -o $@

clean:
	rm -rf $(OBJ_DIR);
	@echo "$(CYAN)✅ make clean finish$(COLOR_RESET)"

fclean: clean
	rm -f $(NAME);
	@echo "$(CYAN)✅ make fclean finish$(COLOR_RESET)"	

re: fclean all
	@echo "$(GREEN)✅ make re finish$(COLOR_RESET)"		

.PHONY: all clean fclean re

#########################################################

t: all clean
	@echo "$(GREEN)✅ run program$(COLOR_RESET)"
	./Server $(CONFIG)



PORT=8080
HOST=localhost



t51:
	curl -v -X POST "http://$(HOST):$(PORT)/session/" \
		-H "Content-Type: application/x-www-form-urlencoded" \
		--data "username=kit"

t52:
	curl -v -X GET "http://$(HOST):$(PORT)/delete/delete.php"

t53:
	curl -v -X GET "http://$(HOST):$(PORT)/"

t54:
	curl -v -X GET "http://$(HOST):$(PORT)/uploads/"

t55:
	curl -v -X POST "http://$(HOST):$(PORT)/uploads" \
		-H "Content-Type: text/html" \
		--data "<h1>Hello World</h1>"

t56:
	curl -v -X POST "http://$(HOST):$(PORT)/uploads" \
		--data-binary @wwwroot/www1/favicon.ico

t57: 
	curl -v -X GET "http://$(HOST):$(PORT)/uploads/s2.txt"
#t57  1aaa  3aaa


t58:
	curl -v -X DELETE "http://$(HOST):$(PORT)/uploads/s2.txt"

t59:
	curl -v -X GET "http://$(HOST):$(PORT)/cgi-bin/processPlayer.py"

t60:
	curl -v -X POST "http://$(HOST):$(PORT)/cgi-bin/processPlayer.py" \
		-H "Content-Type: application/x-www-form-urlencoded" \
		--data "name=kit&score=42"




t61:
	curl -v -X GET "http://$(HOST):$(PORT)/redirect"

t62:
	curl -v -X GET "http://$(HOST):$(PORT)/session"





t63:
	curl -v -X GET "http://$(HOST):$(PORT)/../etc/passwd"

t64:
	curl -v -X DELETE "http://$(HOST):$(PORT)/uploads/notfound.txt"

t65:
	curl -v -X GET "http://$(HOST):$(PORT)/notfound.txt"

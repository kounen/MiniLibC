##
## EPITECH PROJECT, 2021
## B-ASM-400-LYN-4-1-asmminilibc-lucas.guichard
## File description:
## Makefile
##

LIB			=	libasm.so

NASM 		=	nasm

CC			=	gcc

LD			=	ld

NASMFLAGS 	=	-f elf64

CFLAGS		=	-Wall -Wextra -ggdb3 -Iinclude

SHARED		=	-shared

LDFLAGS		=	-lcriterion --coverage

RM			=	rm -f

ASM_SRCS	=	$(wildcard ./sources/*.asm)
TEST_SRCS	=	$(wildcard ./tests/*.c)

ASM_OBJS	=	$(ASM_SRCS:.asm=.o)
TEST_OBJS	=	$(TEST_SRCS:.c=.o)

all:		$(LIB)

$(LIB):		$(ASM_OBJS)
			$(LD) $(SHARED) $(ASM_OBJS) -o $(LIB)

tests_run:	all $(TEST_OBJS)
			$(CC) $(CFLAGS) $(LDFLAGS) $(TEST_OBJS) -ldl
			./a.out

clean:		
			$(RM) $(ASM_OBJS)
			$(RM) $(TEST_OBJS)

fclean:		clean
			$(RM) $(LIB)
			$(RM) a.out

re:			fclean all

%.o : %.asm
			$(NASM) $(NASMFLAGS) $< -o $@

.PHONY:		all clean fclean re

		
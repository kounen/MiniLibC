/*
** EPITECH PROJECT, 2021
** B-ASM-400-LYN-4-1-asmminilibc-lucas.guichard
** File description:
** test_read
*/

#include "unit_tests.h"

Test(read, fillFile, .init = handle_lib)
{
	char buffer[100];
	int	fd = open("tests/fill.txt", O_RDONLY);

    _read(fd, buffer, 100);
	cr_assert_str_eq(buffer, "Hello World");
    close(fd);
}

Test(read, emptyFile, .init = handle_lib)
{
	char buffer[100] = {0};
	int	fd = open("tests/empty.txt", O_RDONLY);

    _read(fd, buffer, 100);
	cr_assert_eq(strlen(buffer), 0);
    close(fd);
}
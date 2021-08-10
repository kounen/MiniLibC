/*
** EPITECH PROJECT, 2021
** B-ASM-400-LYN-4-1-asmminilibc-lucas.guichard
** File description:
** test_rindex
*/

#include "unit_tests.h"

Test(rindex, findCharacter, .init = handle_lib)
{
    char *string = "Hello World";

    cr_assert_str_eq(_rindex(string, 'W'), "World");
}

Test(rindex, stringNULL, .init = handle_lib)
{
    char *string = "";

    cr_assert_null(_rindex(string, 'A'));
}

Test(rindex, characterZero, .init = handle_lib)
{
    char *string = "Hello World";

    cr_assert_str_eq(_rindex(string, '\0'), string + strlen(string));
}
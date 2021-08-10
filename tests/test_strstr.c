/*
** EPITECH PROJECT, 2021
** B-ASM-400-LYN-4-1-asmminilibc-lucas.guichard
** File description:
** test_strstr
*/

#include "unit_tests.h"

Test(strstr, findNeedleWord, .init = handle_lib)
{
    char *string = "Hello World";

    cr_assert_str_eq(_strstr(string, "World"), "World");
}

Test(strstr, findNeedleCharacters, .init = handle_lib)
{
    char *string = "Hello World";

    cr_assert_str_eq(_strstr(string, "ll"), "llo World");
}

Test(strstr, lostNeedleWord, .init = handle_lib)
{
    char *string = "Hello World";

    cr_assert_null(_strstr(string, "You"));
}

Test(strstr, nullHaystack, .init = handle_lib)
{
    char *string = "";

    cr_assert_null(_strstr(string, "World"));
}
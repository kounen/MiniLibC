/*
** EPITECH PROJECT, 2021
** B-ASM-400-LYN-4-1-asmminilibc-lucas.guichard
** File description:
** test_strcmp
*/

#include "unit_tests.h"

Test(strcmp, sameStrings, .init = handle_lib)
{
    char *s1 = "Hello World";
    char *s2 = "Hello World";

    cr_assert_eq(_strcmp(s1, s2), 0);
}

Test(strcmp, firstStringNULL, .init = handle_lib)
{
    char *s1 = "";
    char *s2 = "Hello World";

    cr_assert_eq(_strcmp(s1, s2), -72);
}

Test(strcmp, secondStringNULL, .init = handle_lib)
{
    char *s1 = "Hello World";
    char *s2 = "";

    cr_assert_eq(_strcmp(s1, s2), 72);
}

Test(strcmp, differentStrings, .init = handle_lib)
{
    char *s1 = "Hello World";
    char *s2 = "Hello You";

    cr_assert_eq(_strcmp(s1, s2), -2);
}
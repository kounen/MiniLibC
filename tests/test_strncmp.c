/*
** EPITECH PROJECT, 2021
** B-ASM-400-LYN-4-1-asmminilibc-lucas.guichard
** File description:
** test_strncmp
*/

#include "unit_tests.h"

Test(strncmp, sameStrings, .init = handle_lib)
{
    char *s1 = "Hello World";
    char *s2 = "Hello World";

    cr_assert_eq(_strncmp(s1, s2, 11), 0);
}

Test(strncmp, firstStringNULL, .init = handle_lib)
{
    char *s1 = "";
    char *s2 = "Hello World";

    cr_assert_eq(_strncmp(s1, s2, 11), -72);
}

Test(strncmp, secondStringNULL, .init = handle_lib)
{
    char *s1 = "Hello World";
    char *s2 = "";

    cr_assert_eq(_strncmp(s1, s2, 11), 72);
}

Test(strncmp, differentStrings, .init = handle_lib)
{
    char *s1 = "Hello World";
    char *s2 = "Hello You";

    cr_assert_eq(_strncmp(s1, s2, 11), -2);
}

Test(strncmp, differentStringsButSize, .init = handle_lib)
{
    char *s1 = "Hello World";
    char *s2 = "Hello You";

    cr_assert_eq(_strncmp(s1, s2, 6), 0);
}

Test(strncmp, sizeZero, .init = handle_lib)
{
    char *s1 = "Hello World";
    char *s2 = "Hello World";

    cr_assert_eq(_strncmp(s1, s2, 0), 0);
}
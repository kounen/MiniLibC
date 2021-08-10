/*
** EPITECH PROJECT, 2021
** B-ASM-400-LYN-4-1-asmminilibc-lucas.guichard
** File description:
** test_strcasecmp
*/

#include "unit_tests.h"

Test(strcasecmp, sameStrings, .init = handle_lib)
{
    char *s1 = "HeLlO WoRlD";
    char *s2 = "Hello World";

    cr_assert_eq(_strcasecmp(s1, s2), 0);
}

Test(strcasecmp, firstStringNULL, .init = handle_lib)
{
    char *s1 = "";
    char *s2 = "HeLlO WoRlD";

    cr_assert(_strcasecmp(s1, s2) == strcasecmp(s1, s2));
}

Test(strcasecmp, secondStringNULL, .init = handle_lib)
{
    char *s1 = "HeLlO WoRlD";
    char *s2 = "";

    cr_assert(_strcasecmp(s1, s2) == strcasecmp(s1, s2));
}

Test(strcasecmp, stringsNULL, .init = handle_lib)
{
    char *s1 = "";
    char *s2 = "";

    cr_assert(_strcasecmp(s1, s2) == strcasecmp(s1, s2));
}

Test(strcasecmp, differentStrings, .init = handle_lib)
{
    char *s1 = "HeLlO WoRlD";
    char *s2 = "Hello You";

    cr_assert_eq(_strcasecmp(s1, s2), -2);
}
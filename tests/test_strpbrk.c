/*
** EPITECH PROJECT, 2021
** B-ASM-400-LYN-4-1-asmminilibc-lucas.guichard
** File description:
** test_strpbrk
*/

#include "unit_tests.h"

Test(strpbrk, characterOccurrence, .init = handle_lib)
{
    char *string = "Hello World";

    cr_assert_str_eq(_strpbrk(string, " "), " World");
}

Test(strpbrk, stringOccurrence, .init = handle_lib)
{
    char *string = "Hello World";

    cr_assert_str_eq(_strpbrk(string, "cacao"), "o World");
}

Test(strpbrk, nullString, .init = handle_lib)
{
    char *string = "";

    cr_assert_null(_strpbrk(string, "cacao"));
}

Test(strpbrk, nullOccurrence, .init = handle_lib)
{
    char *string = "Hello World";

    cr_assert_null(_strpbrk(string, ""), "cacao");
}
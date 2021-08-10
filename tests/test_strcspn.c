/*
** EPITECH PROJECT, 2021
** B-ASM-400-LYN-4-1-asmminilibc-lucas.guichard
** File description:
** test_strcspn
*/

#include "unit_tests.h"

Test(strcspn, characterOccurrence, .init = handle_lib)
{
    char *string = "Hello World";

    cr_assert_eq(_strcspn(string, " "), 5);
}

Test(strcspn, stringOccurrence, .init = handle_lib)
{
    char *string = "Hello World";

    cr_assert_eq(_strcspn(string, "cacao"), 4);
}

Test(strcspn, nullString, .init = handle_lib)
{
    char *string = "";

    cr_assert_eq(_strcspn(string, "cacao"), 0);
}

Test(strcspn, nullOccurrence, .init = handle_lib)
{
    char *string = "Hello World";

    cr_assert_eq(_strcspn(string, ""), 11);
}
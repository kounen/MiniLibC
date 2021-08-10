/*
** EPITECH PROJECT, 2021
** B-ASM-400-LYN-4-1-asmminilibc-lucas.guichard
** File description:
** test_strlen
*/

#include "unit_tests.h"

Test(strlen, simpleString, .init = handle_lib)
{
    char *string = "Hello World";

    cr_assert(strlen(string) == _strlen(string));
}

Test(strlen, emptyString, .init = handle_lib)
{
    char *string = "";

    cr_assert(strlen(string) == _strlen(string));
}
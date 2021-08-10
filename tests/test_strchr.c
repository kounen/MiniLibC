/*
** EPITECH PROJECT, 2021
** B-ASM-400-LYN-4-1-asmminilibc-lucas.guichard
** File description:
** test_strchr
*/

#include "unit_tests.h"

Test(strchr, presentCharacter, .init = handle_lib)
{
    cr_assert(strchr("Hello World", 'l') == _strchr("Hello World", 'l'));
}

Test(strchr, lostCharacter, .init = handle_lib)
{
    cr_assert(strchr("Hello World", 'z') == _strchr("Hello World", 'z'));
}

Test(strchr, emptyString, .init = handle_lib)
{
    cr_assert(strchr("", '\0') == _strchr("", '\0'));
}
/*
** EPITECH PROJECT, 2021
** B-ASM-400-LYN-4-1-asmminilibc-lucas.guichard
** File description:
** test_tolower
*/

#include "unit_tests.h"

Test(tolower, lowerCharacter, .init = handle_lib)
{
    cr_assert_eq(_tolower('l'), 'l');
}

Test(tolower, notAlphaCharacter, .init = handle_lib)
{
    cr_assert_eq(_tolower('|'), '|');
}

Test(tolower, upperCharacter, .init = handle_lib)
{
    cr_assert_eq(_tolower('Z'), 'z');
}

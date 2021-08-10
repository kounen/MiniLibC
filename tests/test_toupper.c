/*
** EPITECH PROJECT, 2021
** B-ASM-400-LYN-4-1-asmminilibc-lucas.guichard
** File description:
** test_toupper
*/

#include "unit_tests.h"

Test(toupper, upperCharacter, .init = handle_lib)
{
    cr_assert_eq(_toupper('L'), 'L');
}

Test(toupper, notAlphaCharacter, .init = handle_lib)
{
    cr_assert_eq(_toupper('|'), '|');
}

Test(toupper, lowerCharacter, .init = handle_lib)
{
    cr_assert_eq(_toupper('z'), 'Z');
}

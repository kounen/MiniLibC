/*
** EPITECH PROJECT, 2021
** B-ASM-400-LYN-4-1-asmminilibc-lucas.guichard
** File description:
** test_isalpha
*/

#include "unit_tests.h"

Test(isalpha, isaplhaTrue, .init = handle_lib)
{
    cr_assert_gt(_isalpha('a'), 0);
}

Test(isalpha, isaplhaFalse, .init = handle_lib)
{
    cr_assert_eq(_isalpha('_'), 0);
}
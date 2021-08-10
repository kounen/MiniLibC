/*
** EPITECH PROJECT, 2021
** B-ASM-400-LYN-4-1-asmminilibc-lucas.guichard
** File description:
** test_isdigit
*/

#include "unit_tests.h"

Test(isdigit, isdigitTrue, .init = handle_lib)
{
    cr_assert_gt(_isdigit('1'), 0);
}

Test(isdigit, isdigitFalse, .init = handle_lib)
{
    cr_assert_eq(_isdigit('_'), 0);
}
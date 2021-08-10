/*
** EPITECH PROJECT, 2021
** B-ASM-400-LYN-4-1-asmminilibc-lucas.guichard
** File description:
** test_write
*/

#include "unit_tests.h"

Test(write, simpleString, .init = handle_lib)
{
	cr_redirect_stdout();
    _write(1, "Hello World", 11);
	cr_assert_stdout_eq_str("Hello World");
}
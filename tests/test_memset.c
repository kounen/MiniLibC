/*
** EPITECH PROJECT, 2021
** B-ASM-400-LYN-4-1-asmminilibc-lucas.guichard
** File description:
** test_memset
*/

#include "unit_tests.h"

Test(memset, setAllCharacters, .init = handle_lib)
{
    char string[10] = "Hello You";

    cr_assert_str_eq(_memset(string, 'A', 10), "AAAAAAAAAA");
}

Test(memset, setFirstCharacter, .init = handle_lib)
{
    char string[10] = "Hello You";

    cr_assert_str_eq(_memset(string, 'A', 1), "Aello You");
}

Test(memset, setTooMuchCharacters, .init = handle_lib)
{
    char *string = malloc(10);

    cr_assert(memset(string, 'A', 11) == _memset(string, 'A', 11));
    free(string);
}

Test(memset, setNoneCharacter, .init = handle_lib)
{
    char string[10] = "Hello You";

    cr_assert_str_eq(_memset(string, 'A', 0), "Hello You");
}
/*
** EPITECH PROJECT, 2021
** B-ASM-400-LYN-4-1-asmminilibc-lucas.guichard
** File description:
** test_memmove
*/

#include "unit_tests.h"

Test(memmove, completeCopy, .init = handle_lib)
{
    char *source = strdup("Source");
    char *destination = strdup("Destination");

    cr_assert_str_eq(_memmove(destination, source, 6), "Sourceation");
    free(source);
    free(destination);
}

Test(memmove, overloadCopy, .init = handle_lib)
{
    char *source = strdup("Source");
    char *destination = strdup("Destination");

    cr_assert_str_eq(_memmove(destination, source, 8), "Source");
    free(source);
    free(destination);
}

Test(memmove, firstCharacterCopy, .init = handle_lib)
{
    char *source = strdup("Source");
    char *destination = strdup("Destination");

    cr_assert_str_eq(_memmove(destination, source, 1), "Sestination");
    free(source);
    free(destination);
}

Test(memmove, noneCopy, .init = handle_lib)
{
    char *source = strdup("Source");
    char *destination = strdup("Destination");

    cr_assert_str_eq(_memmove(destination, source, 0), "Destination");
    free(source);
    free(destination);
}
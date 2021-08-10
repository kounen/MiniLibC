/*
** EPITECH PROJECT, 2021
** B-ASM-400-LYN-4-1-asmminilibc-lucas.guichard
** File description:
** test_memcpy
*/

#include "unit_tests.h"

Test(memcpy, completeCopy, .init = handle_lib)
{
    char *source = strdup("Source");
    char *destination = strdup("Destination");

    cr_assert_str_eq(_memcpy(destination, source, 6), "Sourceation");
    free(source);
    free(destination);
}

Test(memcpy, overloadCopy, .init = handle_lib)
{
    char *source = strdup("Source");
    char *destination = strdup("Destination");

    cr_assert_str_eq(_memcpy(destination, source, 8), "Source");
    free(source);
    free(destination);
}

Test(memcpy, firstCharacterCopy, .init = handle_lib)
{
    char *source = strdup("Source");
    char *destination = strdup("Destination");

    cr_assert_str_eq(_memcpy(destination, source, 1), "Sestination");
    free(source);
    free(destination);
}

Test(memcpy, noneCopy, .init = handle_lib)
{
    char *source = strdup("Source");
    char *destination = strdup("Destination");

    cr_assert_str_eq(_memcpy(destination, source, 0), "Destination");
    free(source);
    free(destination);
}
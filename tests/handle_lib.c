/*
** EPITECH PROJECT, 2021
** B-ASM-400-LYN-4-1-asmminilibc-lucas.guichard
** File description:
** handle_lib
*/

#include "unit_tests.h"

size_t (*_strlen)(const char *s);
char *(*_strchr)(const char *s, int c);
void *(*_memset)(void *s, int c, size_t n);
void *(*_memcpy)(void *dest, const void *src, size_t n);
int (*_strcmp)(const char *s1, const char *s2);
void *(*_memmove)(void *dest, const void *src, size_t n);
int (*_strncmp)(const char *s1, const char *s2, size_t n);
int (*_strcasecmp)(const char *s1, const char *s2);
char *(*_rindex)(const char *s, int c);
char *(*_strstr)(const char *haystack, const char *needle);
char *(*_strpbrk)(const char *s, const char *accept);
size_t (*_strcspn)(const char *s, const char *reject);
ssize_t (*_read)(int fd, void *buf, size_t count);
ssize_t (*_write)(int fd, const void *buf, size_t count);
int (*_tolower)(int c);
int (*_toupper)(int c);
int (*_isalpha)(int c);
int (*_isdigit)(int c);

void link_with_lib(void *handle_lib)
{
    _strlen = dlsym(handle_lib, "strlen");
    _strchr = dlsym(handle_lib, "strchr");
    _memset = dlsym(handle_lib, "memset");
    _memcpy = dlsym(handle_lib, "memcpy");
    _strcmp = dlsym(handle_lib, "strcmp");
    _memmove = dlsym(handle_lib, "memmove");
    _strncmp = dlsym(handle_lib, "strncmp");
    _strcasecmp = dlsym(handle_lib, "strcasecmp");
    _rindex = dlsym(handle_lib, "rindex");
    _strstr = dlsym(handle_lib, "strstr");
    _strpbrk = dlsym(handle_lib, "strpbrk");
    _strcspn = dlsym(handle_lib, "strcspn");
    _read = dlsym(handle_lib, "read");
    _write = dlsym(handle_lib, "write");
    _tolower = dlsym(handle_lib, "tolower");
    _toupper = dlsym(handle_lib, "toupper");
    _isalpha = dlsym(handle_lib, "isalpha");
    _isdigit = dlsym(handle_lib, "isdigit");
}

void handle_lib(void)
{
    void *handle_lib = dlopen("./libasm.so", RTLD_LAZY);

    if (!handle_lib)
    {
        fputs(dlerror(), stderr);
        exit(EXIT_FAILURE);
    }
    else
    {
        link_with_lib(handle_lib);
    }
}
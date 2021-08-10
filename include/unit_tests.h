/*
** EPITECH PROJECT, 2021
** B-ASM-400-LYN-4-1-asmminilibc-lucas.guichard
** File description:
** unit_tests
*/

#ifndef UNIT_TESTS_H_
#define UNIT_TESTS_H_

#include <criterion/criterion.h>
#include <criterion/redirect.h>
#include <dlfcn.h>
#include <stdio.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <unistd.h>

void handle_lib(void);

extern size_t (*_strlen)(const char *s);
extern char *(*_strchr)(const char *s, int c);
extern void *(*_memset)(void *s, int c, size_t n);
extern void *(*_memcpy)(void *dest, const void *src, size_t n);
extern int (*_strcmp)(const char *s1, const char *s2);
extern void *(*_memmove)(void *dest, const void *src, size_t n);
extern int (*_strncmp)(const char *s1, const char *s2, size_t n);
extern int (*_strcasecmp)(const char *s1, const char *s2);
extern char *(*_rindex)(const char *s, int c);
extern char *(*_strstr)(const char *haystack, const char *needle);
extern char *(*_strpbrk)(const char *s, const char *accept);
extern size_t (*_strcspn)(const char *s, const char *reject);
extern ssize_t (*_read)(int fd, void *buf, size_t count);
extern ssize_t (*_write)(int fd, const void *buf, size_t count);
extern int (*_tolower)(int c);
extern int (*_toupper)(int c);
extern int (*_isalpha)(int c);
extern int (*_isdigit)(int c);

#endif /* !UNIT_TESTS_H_ */

#include<stdio.h>
#include<string.h>
#include<stdlib.h>

void print(char *str) {
    printf("%s", str);
}

void println(char *str) {
	printf("%s\n", str);
}

void printInt(int n) {
	printf("%d", n);
}

void printlnInt(int n) {
	printf("%d\n", n);
}

char* getString() {
	char* str = malloc(sizeof(char) * 256);
    scanf("%s", str);
    return str;
}

int getInt() {
	int t;
	scanf("%d", &t);
	return t;
}

char* toString(int todo) {
    int sign = 0, len = 0;
    if (todo < 0) {
        sign = 1;
        todo = -todo;
    }
    char *res = malloc(sizeof(char) * (10 + sign));
    char *s = res;
    do {
        *s = '0' + todo % 10;
        s++;
        len++;
        todo /= 10;
    } while (todo > 0);
    if (sign == 1)
        *s = '-';
    else
        s--;
    char *t = res;
    char tmp;
    for (; s != t; ) {
        tmp = *s;
        *s = *t;
        *t = tmp;
        s--;
        if (s == t)
            break;
        else
            t++;
    }
    res[len + 1] = '\0';
    return res;
}

int stringLength(char *str) {
	return strlen(str);
}

char* _stringSubstring(char *str, int l, int r) {
    int len = r - l;
	char* res = malloc(len + 1);
    memcpy(res, str + l, len);
    res[len] = '\0';
    return res;
}

int _stringParseInt(char* str) {
	int res;
    sscanf(str, "%d", &res);
    return res;
}

int _stringOrd(char* str, int pos) {
	return str[pos];
}

int _arraySize(char* array){
   return *((int*)array);
}

char* _stringAdd(char* str1, char* str2) {
	int len1 = strlen(str1);
    int len2 = strlen(str2);
    char* res = malloc(len1 + len2 + 1);
    strcpy(res,str1);
    strcat(res,str2);
    return res;
}

int _stringEqual(char* str1, char *str2) {
	return strcmp(str1, str2) == 0;
}

int _stringNotEqual(char* str1, char* str2) {
	return strcmp(str1, str2) != 0;
}

int _stringLess(char *str1, char* str2) {
	return strcmp(str1, str2) < 0;
}

int _stringLessEqual(char* str1, char* str2) {
	return strcmp(str1, str2) <= 0;
}

int _stringGreater(char* str1, char* str2) {
	return strcmp(str1, str2) > 0;
}

int _stringGreaterEqual(char* str1, char* str2) {
	return strcmp(str1, str2) >= 0;
}


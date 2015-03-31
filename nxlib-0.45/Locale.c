#include <stdio.h>
#include <stdlib.h>

// required for Xt
char *XSetLocaleModifiers(char *modifier_list)
{
	printf("XSetLocaleModifiers called [%s]\n", modifier_list);
	return getenv("LANG");
}

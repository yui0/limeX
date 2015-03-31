unsigned char *src, *dst;

#define restrict	__restrict

main()
{
	int w = x();

	register unsigned char * restrict s = src;
	register unsigned char * restrict d = dst;
	while (--w >= 0)
	{
		d[0] = s[0];
		d[1] = s[1];
		d[2] = s[2];
		d[3] = s[3];
		++d;
		++s;
	}
}

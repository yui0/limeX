unsigned char d[255];

static inline void convblit(int r, int g, int b, int a)
{
	switch(r) {
	case 0:
		func0(); break;
	case 1:
		func1(); break;
	case 2:
		func2(); break;
	}

	d[r] = 1;
	d[g] = 1;
	d[b] = 1;
	if (a > 0)
		d[a] = 1;
}

main()
{
	convblit(0,1,2,-1);
	//convblit(0,1,2,3);
}

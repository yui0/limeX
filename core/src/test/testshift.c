volatile int x;
volatile unsigned long c;
volatile unsigned char *addr;

static const unsigned char notmask[2] = { 0x0f, 0xf0};

main()
{

	*addr = (c << ((1-(x&1))<<2));
	//*addr = (*addr & notmask[x&1]) | (c << ((1-(x&1))<<2));
}

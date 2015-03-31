volatile int x, y;
volatile int pitch;
volatile unsigned long *addr;
volatile unsigned long *base;

main()
{
	//addr = base + y * pitch + x;
	//addr = base + x * 3;
	addr = base + x + x + x;
}

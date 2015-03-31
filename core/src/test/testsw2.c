#include "../include/device.h"
#include "../include/mwtypes.h"
#include "../drivers/fb.h"
uint32_t gr_background;
ADDR32 s, d;

main()
{
	int op, i;

	for (i=0; i<6; ++i) {
		APPLYOP(MWROP_XOR, 1, *(ADDR32), s, *(ADDR32), d, 1, 1);
		s++;
		d++;
	}
}

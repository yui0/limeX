/* transformation matrix*/
typedef struct {
	int	sx, ry;		/* sx  ry 0*/
	int rx, sy;		/* rx  sy 0*/
	int tx, ty;		/* tx  ty 1*/
} TRANSMATRIX, *PTRANSMATRIX;

TRANSMATRIX ctm = { 0, -1, 1, 0, 0, /*xmax-1*/};	/* left*/

static inline void transformXY(PTRANSMATRIX m, MWCOORD *x, MWCOORD *y)
{
	register MWCOORD tmp = *x;
	*x = tmp * m->sx + *y * m->rx + m->tx;
	*y = tmp * m->ry + *y * m->sy + m->ty;
}

void
fbportrait_left_drawpixel(PSD psd,MWCOORD x, MWCOORD y, MWPIXELVAL c)
{
	ctm.ty = psd->xvirtres - 1;
	transformXY(&ctm, &x, &y);
	psd->orgsubdriver->DrawPixel(psd, x, y, c);

	//psd->orgsubdriver->DrawPixel(psd, y, psd->xvirtres-x-1, c);
}

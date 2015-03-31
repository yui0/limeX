#include "nxlib.h"

#include <string.h>
char *ext_name[] = {
	//"SHAPE",
	0
};

Bool XQueryExtension(Display *dpy, _Xconst char *name,
	int *major_opcode, int *first_event, int *first_error)
{
	int n = 1;
	char **p = ext_name;
	printf("XQueryExtension called [%s]\n", name);

	while (*p) {
		if (!strcmp(*p, name)) {
			*major_opcode = n;
			*first_event = 0;
			*first_error = 0;
			return 1;
		}
		n++;
		p++;
	}

	return 0;
}

// This codes run from extutil.c in libXext
// required for Qt
XExtCodes *XInitExtension(Display *dpy, _Xconst char *name)
{
	/*XExtCodes *codes;	// temp. place for extension information
	XExtData *ext, *p;	// _XExtension?

	if (! (codes = Xcalloc(1, sizeof(XExtCodes)))) return 0;
	if (! (ext = Xcalloc(1, sizeof(XExtData)))) return 0;

	if (!XQueryExtension(dpy, name,
		&codes->major_opcode, &codes->first_event,
		&codes->first_error)) return 0;

	if ((p = dpy->ext_data)) {
		for (; p->next; p = p->next) ;
		ext->number = codes->extension = p->number + 1;
		p->next = ext;
	} else {
		ext->number = codes->extension = 1;
		dpy->ext_data = ext;
	}

	printf("XInitExtension called [%s] #%d\n", name, ext->number);
	return codes;*/

	printf("XInitExtension called [%s]\n", name);
	return 0;

	/*if (!XQueryExtension(dpy, name,
		&codes.major_opcode, &codes.first_event,
		&codes.first_error)) return 0;

	LockDisplay(dpy);
	if (! (ext = Xcalloc(1, sizeof(XExtData))) ||
	    ! (ext->name = Xmalloc((unsigned)strlen(name)+1))) {
		if (ext) Xfree((char*)ext);
		UnlockDisplay(dpy);
		return 0;
	}
	codes.extension = dpy->ext_number++;
	ext->codes = codes;
	strcpy(ext->name, name);

	// chain it onto the display list
	ext->next = dpy->ext_procs;
	dpy->ext_procs = ext;
	UnlockDisplay(dpy);

	return &ext->codes;*/
}

static int ext = 0;
XExtCodes *XAddExtension(Display *dpy)
{
	XExtCodes *codes = calloc(1, sizeof(XExtCodes));
	if (codes) {
		codes->major_opcode = ext;
		codes->extension = ext++;
	}
	printf("XAddExtension called [#%d]\n", codes ? codes->extension : -1);
	return codes;

	/*XExtCodes *codes;
	XExtData *ext, *p;	// _XExtension?

	if (! (codes = Xcalloc(1, sizeof(XExtCodes)))) return 0;
	if (! (ext = Xcalloc(1, sizeof(XExtData)))) return 0;

	if ((p = dpy->ext_data)) {
		for (; p->next; p = p->next) ;
		ext->number = codes->extension = p->number + 1;
		p->next = ext;
	} else {
		ext->number = codes->extension = 1;
		dpy->ext_data = ext;
	}

	printf("XAddExtension called [#%d]\n", codes ? codes->extension : -1);
	return codes;*/

	/*_XExtension *ext;

	LockDisplay(dpy);
	if (! (ext = (_XExtension *) Xcalloc (1, sizeof (_XExtension)))) {
		UnlockDisplay(dpy);
		return (XExtCodes *) NULL;
	}
	ext->codes.extension = dpy->ext_number++;

	// chain it onto the display list
	ext->next = dpy->ext_procs;
	dpy->ext_procs = ext;
	UnlockDisplay (dpy);

	return &ext->codes;*/
}

XExtData *_XLookupExtension(Display *dpy, int extension)
{
	XExtData *ext;
	for (ext = dpy->ext_data; ext; ext = ext->next)
		if (ext->number == extension) return ext;
	return NULL;
}

int (*XESetCloseDisplay(Display *dpy, int extension, int (*proc)()))()
{
	int (*oldproc)();
	XExtData *e;
	printf("XESetCloseDisplay called [#%d]\n", extension);
	//return NULL;
	if (!(e = _XLookupExtension(dpy, extension))) return NULL;
	oldproc = e->free_private;
	e->free_private = proc;
	return oldproc;
}

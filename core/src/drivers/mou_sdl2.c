/*
 * Copyright (c) 1999, 2005 Greg Haerr <greg@censoft.com>
 *
 * written by Georg Potthast 2016
 *
 * SDL2 Mouse Driver
 *
 */
#include <stdio.h>
#include <stdlib.h>
//#include <unistd.h>
#include "device.h"
#if defined(__EMSCRIPTEN__)
#include <emscripten.h>
#include <SDL.h>
#else
#include <SDL2/SDL.h>
#endif

#define	SCALE		3	/* default scaling factor for acceleration */
#define	THRESH		5	/* default threshhold for acceleration */

static int  	msdl_Open(MOUSEDEVICE *pmd);
static void 	msdl_Close(void);
static int  	msdl_GetButtonInfo(void);
static void	msdl_GetDefaultAccel(int *pscale,int *pthresh);
static int  	msdl_Read(MWCOORD *dx, MWCOORD *dy, MWCOORD *dz, int *bp);
static int  	msdl_Poll(void);

MOUSEDEVICE mousedev = {
	msdl_Open,
	msdl_Close,
	msdl_GetButtonInfo,
	msdl_GetDefaultAccel,
	msdl_Read,
	msdl_Poll,
};

extern SDL_Window *sdlWindow;
extern SDL_Surface *screen;
extern int unlock_flag;
SDL_Event event;
int closedown;

/*
 * Poll for events
 */

static int msdl_Poll(void)
{
  if (unlock_flag==1){
    if (SDL_MUSTLOCK(screen)) SDL_UnlockSurface(screen);
    SDL_UpdateWindowSurface(sdlWindow);
    unlock_flag=0;
  }

  SDL_PumpEvents();
  if (SDL_PeepEvents(&event, 1, SDL_PEEKEVENT, SDL_FIRSTEVENT, SDL_LASTEVENT)) return 1; //read event in read function

  return 0;   //no event that we are interested in
  
}

/*
 * Open up the mouse device.
 */
static int msdl_Open(MOUSEDEVICE *pmd)
{
  SDL_ShowCursor(SDL_DISABLE); //here, or two mouse cursors
     
  return 1; //ok
}

/*
 * Close the mouse device.
 */
static void msdl_Close(void)
{
//void
}

/*
 * Get mouse buttons supported
 */
static int msdl_GetButtonInfo(void)
{
	return MWBUTTON_L | MWBUTTON_M | MWBUTTON_R | MWBUTTON_U | MWBUTTON_D;
}

/*
 * Get default mouse acceleration settings
 */
static void msdl_GetDefaultAccel(int *pscale,int *pthresh)
{
	*pscale = SCALE;
	*pthresh = THRESH;
}

/*
 * Attempt to read bytes from the mouse and interpret them.
 * Returns -1 on error, 0 if either no bytes were read or not enough
 * was read for a complete state, or 1 if the new state was read.
 * When a new state is read, the current buttons and x and y deltas
 * are returned.  This routine does not block.
 */

static int msdl_Read(MWCOORD *dx, MWCOORD *dy, MWCOORD *dz, int *bp)
{

int xm;
int ym; 

int buttons = 0;

if (SDL_PeepEvents(&event, 1, SDL_PEEKEVENT, SDL_QUIT, SDL_QUIT)) {
#if !defined(__EMSCRIPTEN__)  
    GrClose();
    SDL_Quit();
#endif    
    return 1; //i.e. clicked on X11 close window
}

if (SDL_PeepEvents(&event, 1, SDL_GETEVENT, SDL_MOUSEMOTION, SDL_MOUSEWHEEL)) {
  
if(SDL_GetMouseState(&xm,&ym) & SDL_BUTTON(1)) {
    /* Primary (e.g. left) mouse button */
    buttons |= MWBUTTON_L;
}
if(SDL_GetMouseState(&xm,&ym) & SDL_BUTTON(2)) {
    buttons |= MWBUTTON_R;
    /* Secondary (e.g. right) mouse button */
}
if(SDL_GetMouseState(&xm,&ym) & SDL_BUTTON(3)) {
    /* Tertiary (e.g. middle) mouse button */
    buttons |= MWBUTTON_M;
}

if (event.type == SDL_MOUSEWHEEL) {
   if (event.wheel.y < 0)
        buttons |= MWBUTTON_D; // WHEEL DOWN
   else
        buttons |= MWBUTTON_U; // WHEEL UP
} //SDL_MOUSEWHEEL

*dx=xm;
*dy=ym;
*dz = 0; //unused
*bp = 0;

*bp = buttons;

return 2; //2=absolute mouse position

} //SDL_PeepEvents    

} //msdl_Read


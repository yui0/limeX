//---------------------------------------------------------
//	Microwindows screen driver for the Catcake (OpenGL)
//
//		©2013 Yuichiro Nakada
//---------------------------------------------------------

#include <stdio.h>
#include "catcake_main.h"

// パラメータ
#define SCREEN_WIDTH		640
#define SCREEN_HEIGHT		480
#define SCREEN_HZ		60

#include "device.h"
#include "genfont.h"
#include "genmem.h"
#include "fb.h"

static PSD  fb_open(PSD psd);
static void fb_close(PSD psd);
static void fb_setpalette(PSD psd,int first,int count,MWPALENTRY *pal)
{
}

SCREENDEVICE	scrdev = {
	0, 0, 0, 0, 0, 0, 0, NULL, 0, NULL, 0, 0, 0, 0, 0, 0,
	gen_fonts,
	fb_open,
	fb_close,
	fb_setpalette,
	gen_getscreeninfo,
	gen_allocatememgc,
	gen_mapmemgc,
	gen_freememgc,
	gen_setportrait,
	NULL,				/* Update*/
	NULL				/* PreSelect*/
};

class GLSurface : public ckTask
{
public:
	GLSurface();
	~GLSurface();

private:
	virtual void onUpdate();
	void (GLSurface::*Scene)();
	void SceneUpdate();

	ckTex *m_tex;
	ckSprt m_sprt;
};
void GLSurface::onUpdate()
{
	(this->*Scene)();
}
GLSurface::GLSurface() : ckTask(ORDER_ZERO)
{
	ckSndMgr::openSoundDevice(ckSndMgr::CHANNEL_NUM_STEREO, ckSndMgr::SAMPLE_RATE_44KHZ, 50);

	m_tex = ckDrawMgr::newTexture(ckID::genID(), SCREEN_WIDTH, SCREEN_HEIGHT, ckTex::FORMAT_RGBA);

	m_sprt.init(1, ckDrawMgr::DEFAULT_2D_SCREEN_ID);
	m_sprt.setTextureID(m_tex->getID());
	m_sprt.setBlendMode(ckDraw::BLEND_HALF, true);
	m_sprt.dataPos(0).set(0, 0);	// 真ん中・スプライトの中央の座標
	m_sprt.setDataSize(0, SCREEN_WIDTH, SCREEN_HEIGHT);
	m_sprt.setDataUV(0, 0.0f, 0.0f, 1, 1);

	Scene = &GLSurface::SceneUpdate;
}
GLSurface::~GLSurface()
{
	ckSndMgr::closeSoundDevice();
}

void GLSurface::SceneUpdate()
{
	//u8* image = static_cast<u8*>(m_tex->beginEditImage());

	/*for (int i=0; i<100; i++) {
		image[i                   ] = 100+i;
		image[SCREEN_WIDTH*4  +i+1] = 100+i;
		image[SCREEN_WIDTH*4*2+i+2] = 100+i;
	}*/

	//m_tex->endEditImage();
}

void newGLSurface()
{
	ckNewTask(GLSurface);
}

static PSD fb_open(PSD psd)
{
	PSUBDRIVER subdriver;

	ckCreateCatcake("Framebuffer!", SCREEN_WIDTH, SCREEN_HEIGHT, SCREEN_HZ);

	//ckResMgr::loadResource(RESOURCE_PATH IMAGE_FONT, true);
	//ckResMgr::loadResource(RESOURCE_PATH IMAGE_FONT_P, true);

	//ckMath::srand(static_cast<u32>(ckSysMgr::getUsecTime()));

	newGLSurface();

	psd->xres = psd->xvirtres = SCREEN_WIDTH;
	psd->yres = psd->yvirtres = SCREEN_HEIGHT;
	psd->planes = 1;
	psd->bpp = 32;
	psd->ncolors = 1 << psd->bpp;
	psd->pitch = 512 * 4;
	psd->size = psd->yres * psd->pitch;
	psd->flags = PSF_SCREEN;
	psd->pixtype = MWPF_TRUECOLORABGR;
	psd->data_format = MWIF_RGBA8888;

	subdriver = select_fb_subdriver(psd);
	if (!subdriver) {
		EPRINTF("No driver for screen\n");
		return NULL;
	}
	set_subdriver(psd, subdriver);

	psd->addr = static_cast<u8*>(m_tex->beginEditImage());
	//m_tex->endEditImage();
	return psd;	// success
}

static void fb_close(PSD psd)
{
	ckDestroyCatcake();
}

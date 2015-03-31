Flat profile:

Each sample counts as 0.01 seconds.
  %   cumulative   self              self     total           
 time   seconds   seconds    calls  ms/call  ms/call  name    
 35.71      0.05     0.05   205082     0.00     0.00  linear32a_drawhorzline
 28.57      0.09     0.04       12     3.33     5.70  GdDrawImage
 14.29      0.11     0.02  1964026     0.00     0.00  linear32a_drawpixel
  7.14      0.12     0.01  1027190     0.00     0.00  linear32a_readpixel
  7.14      0.13     0.01      110     0.09     0.09  linear32a_drawvertline
  7.14      0.14     0.01                             inflate_fast
  0.00      0.14     0.00  1340096     0.00     0.00  GdCheckCursor
  0.00      0.14     0.00  1325924     0.00     0.00  GdClipPoint
  0.00      0.14     0.00    51392     0.00     0.00  drawrow
  0.00      0.14     0.00    11617     0.00     0.00  GsPrepareDrawing
  0.00      0.14     0.00    11604     0.00     0.00  GdClipArea
  0.00      0.14     0.00    11499     0.00     0.00  GdFillRect
  0.00      0.14     0.00    11414     0.00     0.00  GrFillRect
  0.00      0.14     0.00    10972     0.00     0.00  GdFixCursor
  0.00      0.14     0.00    10322     0.00     0.00  gen_fillrect
  0.00      0.14     0.00      512     0.00     0.00  GdDestroyRegion
  0.00      0.14     0.00      416     0.00     0.00  GdFindColor
  0.00      0.14     0.00      335     0.00     0.00  GsFindGC
  0.00      0.14     0.00      310     0.00     0.04  GrGetNextEvent
  0.00      0.14     0.00      310     0.00     0.00  wm_find_window
  0.00      0.14     0.00      309     0.00     0.03  wm_handle_event
  0.00      0.14     0.00      301     0.00     0.00  GdMoveMouse
  0.00      0.14     0.00      295     0.00     0.00  GdReadMouse
  0.00      0.14     0.00      295     0.00     0.00  GsCheckMouseEvent
  0.00      0.14     0.00      294     0.00     0.00  GPM_Read
  0.00      0.14     0.00      257     0.00     0.00  GdAllocRectRegion
  0.00      0.14     0.00      257     0.00     0.00  GdSetClipRegion
  0.00      0.14     0.00      257     0.00     0.00  GdSetFillMode
  0.00      0.14     0.00      256     0.00     0.00  GdAllocRegion
  0.00      0.14     0.00      256     0.00     0.00  GsSetClipWindow
  0.00      0.14     0.00      248     0.00     0.00  GdSetForegroundColor
  0.00      0.14     0.00      248     0.00     0.00  GdSetMode
  0.00      0.14     0.00      248     0.00     0.00  REGION_SubtractNonO1
  0.00      0.14     0.00      246     0.00     0.00  GsResetScreenSaver
  0.00      0.14     0.00      203     0.00     0.00  drawbitmap
  0.00      0.14     0.00      203     0.00     0.00  gen_gettextbits
  0.00      0.14     0.00      193     0.00     0.00  GsFindWindow
  0.00      0.14     0.00      164     0.00     0.00  GdSetRectRegion
  0.00      0.14     0.00      164     0.00     0.00  GdSubtractRegion
  0.00      0.14     0.00      164     0.00     0.00  REGION_RegionOp
  0.00      0.14     0.00      164     0.00     0.00  REGION_SubtractO
  0.00      0.14     0.00      163     0.00     0.00  GdSetBackgroundColor
  0.00      0.14     0.00      163     0.00     0.00  GdSetDash
  0.00      0.14     0.00      163     0.00     0.00  GdSetFont
  0.00      0.14     0.00      163     0.00     0.00  GdSetUseBackground
  0.00      0.14     0.00      162     0.00     0.00  GdSetTSOffset
  0.00      0.14     0.00      156     0.00     0.00  GdGetModifierInfo
  0.00      0.14     0.00      156     0.00     0.00  TTY_GetModifierInfo
  0.00      0.14     0.00      155     0.00     0.00  GsCheckCursor
  0.00      0.14     0.00      154     0.00     0.00  GsCheckFocusWindow
  0.00      0.14     0.00      154     0.00     0.00  GsCheckMouseWindow
  0.00      0.14     0.00      152     0.00     0.01  GsHandleMouseStatus
  0.00      0.14     0.00      151     0.00     0.01  GdMoveCursor
  0.00      0.14     0.00      151     0.00     0.01  GrMoveCursor
  0.00      0.14     0.00      151     0.00     0.00  GsDeliverUpdateEvent
  0.00      0.14     0.00      150     0.00     0.01  wm_update
  0.00      0.14     0.00      145     0.00     0.00  GdGetNextTimeout
  0.00      0.14     0.00      145     0.00     0.01  GsSelect
  0.00      0.14     0.00      145     0.00     0.00  wm_container_mousemoved
  0.00      0.14     0.00      105     0.00     0.00  GdHideCursor
  0.00      0.14     0.00      105     0.00     0.07  GdLine
  0.00      0.14     0.00      105     0.00     0.07  GrLine
  0.00      0.14     0.00      101     0.00     0.00  GrNewGC
  0.00      0.14     0.00      100     0.00     0.00  GrDestroyGC
  0.00      0.14     0.00       94     0.00     0.00  GsDeliverExposureEvent
  0.00      0.14     0.00       85     0.00     0.00  GrGetSysColor
  0.00      0.14     0.00       84     0.00     0.00  GrSetGCForeground
  0.00      0.14     0.00       73     0.00     0.00  GdShowCursor
  0.00      0.14     0.00       73     0.00     0.00  GsExposeArea
  0.00      0.14     0.00       72     0.00     0.00  DeliverUpdateMoveEventAndChildren
  0.00      0.14     0.00       72     0.00     0.00  GdBlit
  0.00      0.14     0.00       72     0.00     0.00  GrCopyArea
  0.00      0.14     0.00       72     0.00     0.01  GrMoveWindow
  0.00      0.14     0.00       72     0.00     0.00  GrSetGCMode
  0.00      0.14     0.00       72     0.00     0.00  OffsetWindow
  0.00      0.14     0.00       72     0.00     0.00  linear32a_blit
  0.00      0.14     0.00       60     0.00     0.00  GsDeliverGeneralEvent
  0.00      0.14     0.00       56     0.00     0.18  drawcol
  0.00      0.14     0.00       50     0.00     0.00  GdImageBufferRead
  0.00      0.14     0.00       46     0.00     0.00  png_read_buffer
  0.00      0.14     0.00       45     0.00     0.00  GsDrawBorder
  0.00      0.14     0.00       25     0.00     0.00  GrGetWindowInfo
  0.00      0.14     0.00       21     0.00     0.29  nxDraw3dBox
  0.00      0.14     0.00       12     0.00     5.70  GdDrawImageToFit
  0.00      0.14     0.00       12     0.00     5.70  GrDrawImageToFit
  0.00      0.14     0.00        7     0.00     0.36  GdRect
  0.00      0.14     0.00        7     0.00     0.00  GdText
  0.00      0.14     0.00        7     0.00     0.00  GrGetFocus
  0.00      0.14     0.00        7     0.00     0.00  GrGetWMProperties
  0.00      0.14     0.00        7     0.00     0.36  GrRect
  0.00      0.14     0.00        7     0.00     0.00  GrSetGCUseBackground
  0.00      0.14     0.00        7     0.00     0.00  GrText
  0.00      0.14     0.00        7     0.00     0.00  corefont_drawtext
  0.00      0.14     0.00        7     0.00     0.00  gen_gettextsize
  0.00      0.14     0.00        7     0.00     0.57  nxDraw3dOutset
  0.00      0.14     0.00        7     0.00     1.44  nxPaintNCArea
  0.00      0.14     0.00        7     0.00     1.44  wm_redraw_ncarea
  0.00      0.14     0.00        6     0.00     0.00  GsWpSetFocus
  0.00      0.14     0.00        6     0.00     0.00  wm_container_exposure
  0.00      0.14     0.00        4     0.00     0.00  GPM_GetButtonInfo
  0.00      0.14     0.00        4     0.00     0.00  GdGetButtonInfo
  0.00      0.14     0.00        4     0.00     0.00  GdGetCursorPos
  0.00      0.14     0.00        4     0.00     0.00  GdImageBufferSeekTo
  0.00      0.14     0.00        4     0.00     0.00  GrSetWMProperties
  0.00      0.14     0.00        4     0.00     0.00  gen_getscreeninfo
  0.00      0.14     0.00        3     0.00     0.00  GdGetScreenInfo
  0.00      0.14     0.00        3     0.00     0.00  GdReadKeyboard
  0.00      0.14     0.00        3     0.00     0.00  GrSelectEvents
  0.00      0.14     0.00        3     0.00     0.00  GsCheckKeyboardEvent
  0.00      0.14     0.00        3     0.00     0.00  GsWpRealizeWindow
  0.00      0.14     0.00        3     0.00     0.00  TTY_Read
  0.00      0.14     0.00        3     0.00     0.00  wm_add_window
  0.00      0.14     0.00        2     0.00     0.00  GdCreateFont
  0.00      0.14     0.00        2     0.00     0.01  GdSetCursor
  0.00      0.14     0.00        2     0.00     0.00  GrMapWindow
  0.00      0.14     0.00        2     0.00     0.00  GrNewWindow
  0.00      0.14     0.00        2     0.00     0.00  GrSetFocus
  0.00      0.14     0.00        2     0.00     0.00  GsDeliverButtonEvent
  0.00      0.14     0.00        2     0.00     0.00  GsFindCursor
  0.00      0.14     0.00        2     0.00     0.00  GsGetTickCount
  0.00      0.14     0.00        2     0.00     0.00  NewWindow
  0.00      0.14     0.00        2     0.00     0.00  set_subdriver
  0.00      0.14     0.00        1     0.00     0.00  GPM_Close
  0.00      0.14     0.00        1     0.00     0.00  GPM_Open
  0.00      0.14     0.00        1     0.00     0.00  GdCloseKeyboard
  0.00      0.14     0.00        1     0.00     0.00  GdCloseMouse
  0.00      0.14     0.00        1     0.00     0.00  GdCloseScreen
  0.00      0.14     0.00        1     0.00     0.00  GdDecodeBMP
  0.00      0.14     0.00        1     0.00     0.00  GdDecodeGIF
  0.00      0.14     0.00        1     0.00     0.00  GdDecodeImage
  0.00      0.14     0.00        1     0.00     0.00  GdDecodeJPEG
  0.00      0.14     0.00        1     0.00     0.00  GdDecodePNG
  0.00      0.14     0.00        1     0.00     0.00  GdGetImageInfo
  0.00      0.14     0.00        1     0.00     0.00  GdItemAlloc
  0.00      0.14     0.00        1     0.00     0.00  GdListAdd
  0.00      0.14     0.00        1     0.00     0.00  GdLoadImageFromFile
  0.00      0.14     0.00        1     0.00     0.00  GdOpenKeyboard
  0.00      0.14     0.00        1     0.00     0.00  GdOpenMouse
  0.00      0.14     0.00        1     0.00     0.00  GdOpenScreen
  0.00      0.14     0.00        1     0.00     0.00  GdRestrictMouse
  0.00      0.14     0.00        1     0.00     0.00  GdSetPortraitMode
  0.00      0.14     0.00        1     0.00     0.00  GdSetStippleBitmap
  0.00      0.14     0.00        1     0.00     0.00  GrGetImageInfo
  0.00      0.14     0.00        1     0.00     0.00  GrGetScreenInfo
  0.00      0.14     0.00        1     0.00     0.00  GrLoadImageFromFile
  0.00      0.14     0.00        1     0.00     0.00  GrNewCursor
  0.00      0.14     0.00        1     0.00     0.00  GrNewWindowEx
  0.00      0.14     0.00        1     0.00     0.04  GrOpen
  0.00      0.14     0.00        1     0.00     0.00  GrRaiseWindow
  0.00      0.14     0.00        1     0.00     0.00  GrReparentWindow
  0.00      0.14     0.00        1     0.00     0.02  GrSetWindowCursor
  0.00      0.14     0.00        1     0.00     0.04  GsInitialize
  0.00      0.14     0.00        1     0.00     0.00  GsRedrawScreen
  0.00      0.14     0.00        1     0.00     0.00  GsTerminate
  0.00      0.14     0.00        1     0.00     0.00  GsWpNotifyActivate
  0.00      0.14     0.00        1     0.00     0.00  GsWpUnrealizeWindow
  0.00      0.14     0.00        1     0.00     0.00  MOU_GetDefaultAccel
  0.00      0.14     0.00        1     0.00     0.00  TTY_Close
  0.00      0.14     0.00        1     0.00     0.00  TTY_Open
  0.00      0.14     0.00        1     0.00     0.00  fb_close
  0.00      0.14     0.00        1     0.00     0.00  fb_open
  0.00      0.14     0.00        1     0.00     0.00  fb_setportrait
  0.00      0.14     0.00        1     0.00     0.00  linear32a_init
  0.00      0.14     0.00        1     0.00     0.00  select_fb_subdriver
  0.00      0.14     0.00        1     0.00     0.00  wm_client_window_remap
  0.00      0.14     0.00        1     0.00     0.00  wm_container_buttondown
  0.00      0.14     0.00        1     0.00     0.00  wm_container_buttonup
  0.00      0.14     0.00        1     0.00     0.00  wm_init
  0.00      0.14     0.00        1     0.00     0.01  wm_new_client_window

 %         the percentage of the total running time of the
time       program used by this function.

cumulative a running sum of the number of seconds accounted
 seconds   for by this function and those listed above it.

 self      the number of seconds accounted for by this
seconds    function alone.  This is the major sort for this
           listing.

calls      the number of times this function was invoked, if
           this function is profiled, else blank.
 
 self      the average number of milliseconds spent in this
ms/call    function per call, if this function is profiled,
	   else blank.

 total     the average number of milliseconds spent in this
ms/call    function and its descendents per call, if this 
	   function is profiled, else blank.

name       the name of the function.  This is the minor sort
           for this listing. The index shows the location of
	   the function in the gprof listing. If the index is
	   in parenthesis it shows where it would appear in
	   the gprof listing if it were to be printed.

		     Call graph (explanation follows)


granularity: each sample hit covers 4 byte(s) for 7.14% of 0.14 seconds

index % time    self  children    called     name
                                                 <spontaneous>
[1]     92.9    0.00    0.13                 main [1]
                0.00    0.07      12/12          GrDrawImageToFit [4]
                0.00    0.05   11400/11414       GrFillRect [7]
                0.00    0.01     310/310         GrGetNextEvent [10]
                0.00    0.00       1/1           GrOpen [40]
                0.00    0.00       1/2           GrMapWindow [52]
                0.00    0.00       1/1           GrNewWindowEx [60]
                0.00    0.00      12/25          GrGetWindowInfo [109]
                0.00    0.00       1/1           GrLoadImageFromFile [155]
                0.00    0.00       1/3           GrSelectEvents [123]
                0.00    0.00       1/101         GrNewGC [96]
                0.00    0.00       1/1           GrGetImageInfo [153]
-----------------------------------------------
                0.04    0.03      12/12          GdDrawImageToFit [3]
[2]     48.9    0.04    0.03      12         GdDrawImage [2]
                0.02    0.00 1866128/1964026     linear32a_drawpixel [9]
                0.01    0.00  960630/1027190     linear32a_readpixel [14]
                0.00    0.00 1246400/1325924     GdClipPoint [39]
                0.00    0.00      12/10972       GdFixCursor [37]
                0.00    0.00      12/11604       GdClipArea [59]
-----------------------------------------------
                0.00    0.07      12/12          GrDrawImageToFit [4]
[3]     48.9    0.00    0.07      12         GdDrawImageToFit [3]
                0.04    0.03      12/12          GdDrawImage [2]
-----------------------------------------------
                0.00    0.07      12/12          main [1]
[4]     48.9    0.00    0.07      12         GrDrawImageToFit [4]
                0.00    0.07      12/12          GdDrawImageToFit [3]
                0.00    0.00      12/11617       GsPrepareDrawing [63]
-----------------------------------------------
                0.01    0.00   34677/205082      drawrow [18]
                0.04    0.00  170405/205082      gen_fillrect [8]
[5]     35.7    0.05    0.00  205082         linear32a_drawhorzline [5]
-----------------------------------------------
                0.00    0.00      85/11499       GsResetScreenSaver [33]
                0.00    0.05   11414/11499       GrFillRect [7]
[6]     35.7    0.00    0.05   11499         GdFillRect [6]
                0.00    0.04   10320/10322       gen_fillrect [8]
                0.00    0.01   51329/51392       drawrow [18]
                0.00    0.00   11499/11604       GdClipArea [59]
-----------------------------------------------
                0.00    0.00      14/11414       nxPaintNCArea [11]
                0.00    0.05   11400/11414       main [1]
[7]     35.5    0.00    0.05   11414         GrFillRect [7]
                0.00    0.05   11414/11499       GdFillRect [6]
                0.00    0.00   10614/10972       GdFixCursor [37]
                0.00    0.00   11414/11617       GsPrepareDrawing [63]
-----------------------------------------------
                0.00    0.00       1/10322       GsInitialize [41]
                0.00    0.00       1/10322       GdOpenScreen [51]
                0.00    0.04   10320/10322       GdFillRect [6]
[8]     29.7    0.00    0.04   10322         gen_fillrect [8]
                0.04    0.00  170405/205082      linear32a_drawhorzline [5]
-----------------------------------------------
                0.00    0.00      70/1964026     GdLine [20]
                0.00    0.00    1516/1964026     GdSetCursor [46]
                0.00    0.00    2814/1964026     drawbitmap [45]
                0.00    0.00    3601/1964026     GdFixCursor [37]
                0.00    0.00    8496/1964026     GdShowCursor [35]
                0.00    0.00   26880/1964026     GdHideCursor [34]
                0.00    0.00   54521/1964026     GdMoveCursor [30]
                0.02    0.00 1866128/1964026     GdDrawImage [2]
[9]     14.3    0.02    0.00 1964026         linear32a_drawpixel [9]
-----------------------------------------------
                0.00    0.01     310/310         main [1]
[10]     8.5    0.00    0.01     310         GrGetNextEvent [10]
                0.00    0.01     309/309         wm_handle_event [17]
                0.00    0.00     150/150         wm_update [25]
                0.00    0.00     145/145         GsSelect [26]
-----------------------------------------------
                0.00    0.01       7/7           wm_redraw_ncarea [12]
[11]     7.2    0.00    0.01       7         nxPaintNCArea [11]
                0.00    0.00       7/7           nxDraw3dOutset [22]
                0.00    0.00       7/7           GrRect [23]
                0.00    0.00       7/21          nxDraw3dBox [21]
                0.00    0.00      21/105         GrLine [19]
                0.00    0.00      14/11414       GrFillRect [7]
                0.00    0.00       7/7           GrText [43]
                0.00    0.00      56/85          GrGetSysColor [99]
                0.00    0.00      42/84          GrSetGCForeground [100]
                0.00    0.00       7/101         GrNewGC [96]
                0.00    0.00       7/7           GrSetGCUseBackground [112]
                0.00    0.00       7/100         GrDestroyGC [97]
-----------------------------------------------
                0.00    0.00       1/7           wm_update [25]
                0.00    0.01       6/7           wm_handle_event [17]
[12]     7.2    0.00    0.01       7         wm_redraw_ncarea [12]
                0.00    0.01       7/7           nxPaintNCArea [11]
                0.00    0.00       7/25          GrGetWindowInfo [109]
                0.00    0.00       7/7           GrGetWMProperties [111]
                0.00    0.00       7/7           GrGetFocus [110]
                0.00    0.00       7/100         GrDestroyGC [97]
-----------------------------------------------
                0.00    0.00      14/56          GdRect [24]
                0.00    0.01      42/56          GdLine [20]
[13]     7.1    0.00    0.01      56         drawcol [13]
                0.01    0.00     110/110         linear32a_drawvertline [15]
                0.00    0.00     110/1325924     GdClipPoint [39]
                0.00    0.00      56/1340096     GdCheckCursor [38]
-----------------------------------------------
                0.00    0.00     512/1027190     GdSetCursor [46]
                0.00    0.00    8448/1027190     GdFixCursor [37]
                0.00    0.00   18432/1027190     GdShowCursor [35]
                0.00    0.00   39168/1027190     GdMoveCursor [30]
                0.01    0.00  960630/1027190     GdDrawImage [2]
[14]     7.1    0.01    0.00 1027190         linear32a_readpixel [14]
-----------------------------------------------
                0.01    0.00     110/110         drawcol [13]
[15]     7.1    0.01    0.00     110         linear32a_drawvertline [15]
-----------------------------------------------
                                                 <spontaneous>
[16]     7.1    0.01    0.00                 inflate_fast [16]
-----------------------------------------------
                0.00    0.01     309/309         GrGetNextEvent [10]
[17]     6.6    0.00    0.01     309         wm_handle_event [17]
                0.00    0.01       6/7           wm_redraw_ncarea [12]
                0.00    0.00     145/145         wm_container_mousemoved [31]
                0.00    0.00     159/310         wm_find_window [67]
                0.00    0.00       6/6           wm_container_exposure [115]
                0.00    0.00       1/1           wm_container_buttondown [169]
                0.00    0.00       1/1           wm_container_buttonup [170]
-----------------------------------------------
                0.00    0.00      14/51392       GdRect [24]
                0.00    0.00      49/51392       GdLine [20]
                0.00    0.01   51329/51392       GdFillRect [6]
[18]     6.0    0.00    0.01   51392         drawrow [18]
                0.01    0.00   34677/205082      linear32a_drawhorzline [5]
                0.00    0.00   79009/1325924     GdClipPoint [39]
                0.00    0.00   51392/1340096     GdCheckCursor [38]
-----------------------------------------------
                0.00    0.00      21/105         nxPaintNCArea [11]
                0.00    0.01      84/105         nxDraw3dBox [21]
[19]     5.4    0.00    0.01     105         GrLine [19]
                0.00    0.01     105/105         GdLine [20]
                0.00    0.00     105/10972       GdFixCursor [37]
                0.00    0.00     105/11617       GsPrepareDrawing [63]
-----------------------------------------------
                0.00    0.01     105/105         GrLine [19]
[20]     5.4    0.00    0.01     105         GdLine [20]
                0.00    0.01      42/56          drawcol [13]
                0.00    0.00      49/51392       drawrow [18]
                0.00    0.00      70/1964026     linear32a_drawpixel [9]
                0.00    0.00      70/1325924     GdClipPoint [39]
                0.00    0.00      14/11604       GdClipArea [59]
-----------------------------------------------
                0.00    0.00       7/21          nxPaintNCArea [11]
                0.00    0.00      14/21          nxDraw3dOutset [22]
[21]     4.3    0.00    0.01      21         nxDraw3dBox [21]
                0.00    0.01      84/105         GrLine [19]
                0.00    0.00      42/84          GrSetGCForeground [100]
                0.00    0.00      21/101         GrNewGC [96]
-----------------------------------------------
                0.00    0.00       7/7           nxPaintNCArea [11]
[22]     2.9    0.00    0.00       7         nxDraw3dOutset [22]
                0.00    0.00      14/21          nxDraw3dBox [21]
                0.00    0.00      28/85          GrGetSysColor [99]
                0.00    0.00      14/100         GrDestroyGC [97]
-----------------------------------------------
                0.00    0.00       7/7           nxPaintNCArea [11]
[23]     1.8    0.00    0.00       7         GrRect [23]
                0.00    0.00       7/7           GdRect [24]
                0.00    0.00       7/10972       GdFixCursor [37]
                0.00    0.00       7/11617       GsPrepareDrawing [63]
-----------------------------------------------
                0.00    0.00       7/7           GrRect [23]
[24]     1.8    0.00    0.00       7         GdRect [24]
                0.00    0.00      14/56          drawcol [13]
                0.00    0.00      14/51392       drawrow [18]
-----------------------------------------------
                0.00    0.00     150/150         GrGetNextEvent [10]
[25]     1.0    0.00    0.00     150         wm_update [25]
                0.00    0.00       1/7           wm_redraw_ncarea [12]
                0.00    0.00       1/1           wm_new_client_window [49]
                0.00    0.00     150/310         wm_find_window [67]
                0.00    0.00       1/1           wm_client_window_remap [168]
-----------------------------------------------
                0.00    0.00     145/145         GrGetNextEvent [10]
[26]     0.8    0.00    0.00     145         GsSelect [26]
                0.00    0.00     295/295         GsCheckMouseEvent [27]
                0.00    0.00       3/3           GsCheckKeyboardEvent [56]
                0.00    0.00     145/145         GdGetNextTimeout [95]
-----------------------------------------------
                0.00    0.00     295/295         GsSelect [26]
[27]     0.8    0.00    0.00     295         GsCheckMouseEvent [27]
                0.00    0.00     152/152         GsHandleMouseStatus [28]
                0.00    0.00     295/295         GdReadMouse [69]
-----------------------------------------------
                0.00    0.00     152/152         GsCheckMouseEvent [27]
[28]     0.8    0.00    0.00     152         GsHandleMouseStatus [28]
                0.00    0.00     150/151         GrMoveCursor [29]
                0.00    0.00     151/246         GsResetScreenSaver [33]
                0.00    0.00     152/156         TTY_GetModifierInfo [91]
                0.00    0.00     152/156         GdGetModifierInfo [90]
                0.00    0.00       2/2           GsDeliverButtonEvent [129]
-----------------------------------------------
                0.00    0.00       1/151         GsInitialize [41]
                0.00    0.00     150/151         GsHandleMouseStatus [28]
[29]     0.7    0.00    0.00     151         GrMoveCursor [29]
                0.00    0.00     149/151         GdMoveCursor [30]
                0.00    0.00     151/155         GsCheckCursor [48]
                0.00    0.00     151/154         GsCheckMouseWindow [93]
                0.00    0.00     151/154         GsCheckFocusWindow [92]
                0.00    0.00     149/301         GdMoveMouse [68]
-----------------------------------------------
                0.00    0.00       1/151         GrSetWindowCursor [47]
                0.00    0.00       1/151         GsCheckCursor [48]
                0.00    0.00     149/151         GrMoveCursor [29]
[30]     0.7    0.00    0.00     151         GdMoveCursor [30]
                0.00    0.00   54521/1964026     linear32a_drawpixel [9]
                0.00    0.00   39168/1027190     linear32a_readpixel [14]
-----------------------------------------------
                0.00    0.00     145/145         wm_handle_event [17]
[31]     0.4    0.00    0.00     145         wm_container_mousemoved [31]
                0.00    0.00      72/72          GrMoveWindow [32]
-----------------------------------------------
                0.00    0.00      72/72          wm_container_mousemoved [31]
[32]     0.4    0.00    0.00      72         GrMoveWindow [32]
                0.00    0.00      72/73          GdShowCursor [35]
                0.00    0.00      72/105         GdHideCursor [34]
                0.00    0.00      72/73          GsExposeArea [36]
                0.00    0.00      72/72          GrCopyArea [55]
                0.00    0.00      72/193         GsFindWindow [80]
                0.00    0.00      72/101         GrNewGC [96]
                0.00    0.00      72/72          GrSetGCMode [102]
                0.00    0.00      72/72          OffsetWindow [103]
                0.00    0.00      72/100         GrDestroyGC [97]
                0.00    0.00      72/72          DeliverUpdateMoveEventAndChildren [101]
-----------------------------------------------
                0.00    0.00       1/246         GsWpUnrealizeWindow [58]
                0.00    0.00       1/246         GsRedrawScreen [57]
                0.00    0.00       1/246         GsCheckKeyboardEvent [56]
                0.00    0.00       3/246         GsWpRealizeWindow [50]
                0.00    0.00      89/246         GsExposeArea [36]
                0.00    0.00     151/246         GsHandleMouseStatus [28]
[33]     0.3    0.00    0.00     246         GsResetScreenSaver [33]
                0.00    0.00      85/11499       GdFillRect [6]
                0.00    0.00      83/10972       GdFixCursor [37]
                0.00    0.00      94/512         GdDestroyRegion [64]
                0.00    0.00      94/256         GsSetClipWindow [75]
                0.00    0.00      94/257         GdSetFillMode [73]
                0.00    0.00      85/248         GdSetMode [77]
                0.00    0.00      85/248         GdSetForegroundColor [76]
-----------------------------------------------
                0.00    0.00      33/105         GdCheckCursor [38]
                0.00    0.00      72/105         GrMoveWindow [32]
[34]     0.2    0.00    0.00     105         GdHideCursor [34]
                0.00    0.00   26880/1964026     linear32a_drawpixel [9]
-----------------------------------------------
                0.00    0.00       1/73          GsInitialize [41]
                0.00    0.00      72/73          GrMoveWindow [32]
[35]     0.2    0.00    0.00      73         GdShowCursor [35]
                0.00    0.00   18432/1027190     linear32a_readpixel [14]
                0.00    0.00    8496/1964026     linear32a_drawpixel [9]
-----------------------------------------------
                0.00    0.00       1/73          GrSetWMProperties [54]
                0.00    0.00      72/73          GrMoveWindow [32]
[36]     0.1    0.00    0.00      73         GsExposeArea [36]
                0.00    0.00      89/246         GsResetScreenSaver [33]
                0.00    0.00      89/94          GsDeliverExposureEvent [98]
                0.00    0.00      42/45          GsDrawBorder [108]
-----------------------------------------------
                0.00    0.00       7/10972       GrRect [23]
                0.00    0.00       7/10972       corefont_drawtext [44]
                0.00    0.00      12/10972       GdDrawImage [2]
                0.00    0.00      83/10972       GsResetScreenSaver [33]
                0.00    0.00     105/10972       GrLine [19]
                0.00    0.00     144/10972       GrCopyArea [55]
                0.00    0.00   10614/10972       GrFillRect [7]
[37]     0.1    0.00    0.00   10972         GdFixCursor [37]
                0.00    0.00    8448/1027190     linear32a_readpixel [14]
                0.00    0.00    3601/1964026     linear32a_drawpixel [9]
-----------------------------------------------
                0.00    0.00      56/1340096     drawcol [13]
                0.00    0.00      72/1340096     GrCopyArea [55]
                0.00    0.00      90/1340096     GdBlit [62]
                0.00    0.00   10399/1340096     GdClipArea [59]
                0.00    0.00   51392/1340096     drawrow [18]
                0.00    0.00 1278087/1340096     GdClipPoint [39]
[38]     0.1    0.00    0.00 1340096         GdCheckCursor [38]
                0.00    0.00      33/105         GdHideCursor [34]
-----------------------------------------------
                0.00    0.00      70/1325924     GdLine [20]
                0.00    0.00     110/1325924     drawcol [13]
                0.00    0.00     335/1325924     GdClipArea [59]
                0.00    0.00   79009/1325924     drawrow [18]
                0.00    0.00 1246400/1325924     GdDrawImage [2]
[39]     0.1    0.00    0.00 1325924         GdClipPoint [39]
                0.00    0.00 1278087/1340096     GdCheckCursor [38]
-----------------------------------------------
                0.00    0.00       1/1           main [1]
[40]     0.0    0.00    0.00       1         GrOpen [40]
                0.00    0.00       1/1           GsInitialize [41]
                0.00    0.00       1/1           wm_init [61]
-----------------------------------------------
                0.00    0.00       1/1           GrOpen [40]
[41]     0.0    0.00    0.00       1         GsInitialize [41]
                0.00    0.00       1/1           GrSetWindowCursor [47]
                0.00    0.00       1/151         GrMoveCursor [29]
                0.00    0.00       1/1           GdOpenScreen [51]
                0.00    0.00       1/10322       gen_fillrect [8]
                0.00    0.00       1/73          GdShowCursor [35]
                0.00    0.00       1/1           GsRedrawScreen [57]
                0.00    0.00       1/1           GdOpenKeyboard [148]
                0.00    0.00       1/1           GdSetPortraitMode [151]
                0.00    0.00       1/1           GdOpenMouse [149]
                0.00    0.00       1/2           GdCreateFont [126]
                0.00    0.00       1/1           GrNewCursor [156]
                0.00    0.00       1/2           GsFindCursor [130]
                0.00    0.00       1/416         GdFindColor [65]
                0.00    0.00       1/1           GdRestrictMouse [150]
                0.00    0.00       1/301         GdMoveMouse [68]
-----------------------------------------------
                0.00    0.00       7/7           GrText [43]
[42]     0.0    0.00    0.00       7         GdText [42]
                0.00    0.00       7/7           corefont_drawtext [44]
-----------------------------------------------
                0.00    0.00       7/7           nxPaintNCArea [11]
[43]     0.0    0.00    0.00       7         GrText [43]
                0.00    0.00       7/7           GdText [42]
                0.00    0.00       7/11617       GsPrepareDrawing [63]
-----------------------------------------------
                0.00    0.00       7/7           GdText [42]
[44]     0.0    0.00    0.00       7         corefont_drawtext [44]
                0.00    0.00     203/203         drawbitmap [45]
                0.00    0.00       7/10972       GdFixCursor [37]
                0.00    0.00       7/11604       GdClipArea [59]
                0.00    0.00     203/203         gen_gettextbits [79]
                0.00    0.00       7/7           gen_gettextsize [113]
-----------------------------------------------
                0.00    0.00     203/203         corefont_drawtext [44]
[45]     0.0    0.00    0.00     203         drawbitmap [45]
                0.00    0.00    2814/1964026     linear32a_drawpixel [9]
-----------------------------------------------
                0.00    0.00       1/2           GrSetWindowCursor [47]
                0.00    0.00       1/2           GsCheckCursor [48]
[46]     0.0    0.00    0.00       2         GdSetCursor [46]
                0.00    0.00    1516/1964026     linear32a_drawpixel [9]
                0.00    0.00     512/1027190     linear32a_readpixel [14]
                0.00    0.00       4/416         GdFindColor [65]
-----------------------------------------------
                0.00    0.00       1/1           GsInitialize [41]
[47]     0.0    0.00    0.00       1         GrSetWindowCursor [47]
                0.00    0.00       1/2           GdSetCursor [46]
                0.00    0.00       1/151         GdMoveCursor [30]
                0.00    0.00       1/155         GsCheckCursor [48]
                0.00    0.00       1/193         GsFindWindow [80]
                0.00    0.00       1/2           GsFindCursor [130]
-----------------------------------------------
                0.00    0.00       1/155         GrSetWindowCursor [47]
                0.00    0.00       3/155         GsWpRealizeWindow [50]
                0.00    0.00     151/155         GrMoveCursor [29]
[48]     0.0    0.00    0.00     155         GsCheckCursor [48]
                0.00    0.00       1/2           GdSetCursor [46]
                0.00    0.00       1/151         GdMoveCursor [30]
-----------------------------------------------
                0.00    0.00       1/1           wm_update [25]
[49]     0.0    0.00    0.00       1         wm_new_client_window [49]
                0.00    0.00       1/1           GrReparentWindow [53]
                0.00    0.00       1/2           GrMapWindow [52]
                0.00    0.00       2/4           GrSetWMProperties [54]
                0.00    0.00       2/3           wm_add_window [125]
                0.00    0.00       1/25          GrGetWindowInfo [109]
                0.00    0.00       1/2           GrNewWindow [127]
                0.00    0.00       1/3           GrSelectEvents [123]
                0.00    0.00       1/2           GrSetFocus [128]
                0.00    0.00       1/1           GrGetScreenInfo [154]
-----------------------------------------------
                                   1             GsWpRealizeWindow [50]
                0.00    0.00       1/3           GrReparentWindow [53]
                0.00    0.00       2/3           GrMapWindow [52]
[50]     0.0    0.00    0.00       3+1       GsWpRealizeWindow [50]
                0.00    0.00       3/246         GsResetScreenSaver [33]
                0.00    0.00       3/155         GsCheckCursor [48]
                0.00    0.00       3/151         GsDeliverUpdateEvent [94]
                0.00    0.00       3/45          GsDrawBorder [108]
                0.00    0.00       3/94          GsDeliverExposureEvent [98]
                0.00    0.00       3/154         GsCheckMouseWindow [93]
                0.00    0.00       3/154         GsCheckFocusWindow [92]
                                   1             GsWpRealizeWindow [50]
-----------------------------------------------
                0.00    0.00       1/1           GsInitialize [41]
[51]     0.0    0.00    0.00       1         GdOpenScreen [51]
                0.00    0.00       1/10322       gen_fillrect [8]
                0.00    0.00       1/1           fb_open [164]
                0.00    0.00       1/4           gen_getscreeninfo [120]
                0.00    0.00       1/4           GdGetButtonInfo [117]
                0.00    0.00       1/156         TTY_GetModifierInfo [91]
                0.00    0.00       1/156         GdGetModifierInfo [90]
                0.00    0.00       1/4           GdGetCursorPos [118]
                0.00    0.00       1/248         GdSetMode [77]
                0.00    0.00       1/257         GdSetFillMode [73]
                0.00    0.00       1/248         GdSetForegroundColor [76]
                0.00    0.00       1/163         GdSetBackgroundColor [85]
                0.00    0.00       1/163         GdSetUseBackground [88]
                0.00    0.00       1/2           GdCreateFont [126]
                0.00    0.00       1/163         GdSetFont [87]
                0.00    0.00       1/163         GdSetDash [86]
                0.00    0.00       1/1           GdSetStippleBitmap [152]
                0.00    0.00       1/257         GdAllocRectRegion [71]
                0.00    0.00       1/257         GdSetClipRegion [72]
-----------------------------------------------
                0.00    0.00       1/2           main [1]
                0.00    0.00       1/2           wm_new_client_window [49]
[52]     0.0    0.00    0.00       2         GrMapWindow [52]
                0.00    0.00       2/3           GsWpRealizeWindow [50]
                0.00    0.00       2/193         GsFindWindow [80]
-----------------------------------------------
                0.00    0.00       1/1           wm_new_client_window [49]
[53]     0.0    0.00    0.00       1         GrReparentWindow [53]
                0.00    0.00       1/3           GsWpRealizeWindow [50]
                0.00    0.00       1/1           GsWpUnrealizeWindow [58]
                0.00    0.00       2/193         GsFindWindow [80]
                0.00    0.00       1/151         GsDeliverUpdateEvent [94]
-----------------------------------------------
                0.00    0.00       1/4           GrNewWindowEx [60]
                0.00    0.00       1/4           wm_init [61]
                0.00    0.00       2/4           wm_new_client_window [49]
[54]     0.0    0.00    0.00       4         GrSetWMProperties [54]
                0.00    0.00       1/73          GsExposeArea [36]
                0.00    0.00       4/193         GsFindWindow [80]
                0.00    0.00       1/1           GsWpNotifyActivate [159]
-----------------------------------------------
                0.00    0.00      72/72          GrMoveWindow [32]
[55]     0.0    0.00    0.00      72         GrCopyArea [55]
                0.00    0.00     144/10972       GdFixCursor [37]
                0.00    0.00      72/72          GdBlit [62]
                0.00    0.00      72/1340096     GdCheckCursor [38]
                0.00    0.00      72/193         GsFindWindow [80]
                0.00    0.00      72/11617       GsPrepareDrawing [63]
                0.00    0.00      72/335         GsFindGC [66]
-----------------------------------------------
                0.00    0.00       3/3           GsSelect [26]
[56]     0.0    0.00    0.00       3         GsCheckKeyboardEvent [56]
                0.00    0.00       1/246         GsResetScreenSaver [33]
                0.00    0.00       3/3           TTY_Read [124]
                0.00    0.00       3/3           GdReadKeyboard [122]
                0.00    0.00       1/1           GsTerminate [158]
-----------------------------------------------
                0.00    0.00       1/1           GsInitialize [41]
[57]     0.0    0.00    0.00       1         GsRedrawScreen [57]
                0.00    0.00       1/246         GsResetScreenSaver [33]
                0.00    0.00       1/94          GsDeliverExposureEvent [98]
-----------------------------------------------
                0.00    0.00       1/1           GrReparentWindow [53]
[58]     0.0    0.00    0.00       1         GsWpUnrealizeWindow [58]
                0.00    0.00       1/246         GsResetScreenSaver [33]
                0.00    0.00       1/151         GsDeliverUpdateEvent [94]
                0.00    0.00       1/94          GsDeliverExposureEvent [98]
-----------------------------------------------
                0.00    0.00       7/11604       corefont_drawtext [44]
                0.00    0.00      12/11604       GdDrawImage [2]
                0.00    0.00      14/11604       GdLine [20]
                0.00    0.00      72/11604       GdBlit [62]
                0.00    0.00   11499/11604       GdFillRect [6]
[59]     0.0    0.00    0.00   11604         GdClipArea [59]
                0.00    0.00   10399/1340096     GdCheckCursor [38]
                0.00    0.00     335/1325924     GdClipPoint [39]
-----------------------------------------------
                0.00    0.00       1/1           main [1]
[60]     0.0    0.00    0.00       1         GrNewWindowEx [60]
                0.00    0.00       1/4           GrSetWMProperties [54]
                0.00    0.00       1/2           GrNewWindow [127]
-----------------------------------------------
                0.00    0.00       1/1           GrOpen [40]
[61]     0.0    0.00    0.00       1         wm_init [61]
                0.00    0.00       1/4           GrSetWMProperties [54]
                0.00    0.00       1/3           wm_add_window [125]
                0.00    0.00       1/3           GrSelectEvents [123]
                0.00    0.00       1/85          GrGetSysColor [99]
-----------------------------------------------
                0.00    0.00      72/72          GrCopyArea [55]
[62]     0.0    0.00    0.00      72         GdBlit [62]
                0.00    0.00      90/1340096     GdCheckCursor [38]
                0.00    0.00      72/11604       GdClipArea [59]
                0.00    0.00      72/72          linear32a_blit [104]
-----------------------------------------------
                0.00    0.00       7/11617       GrText [43]
                0.00    0.00       7/11617       GrRect [23]
                0.00    0.00      12/11617       GrDrawImageToFit [4]
                0.00    0.00      72/11617       GrCopyArea [55]
                0.00    0.00     105/11617       GrLine [19]
                0.00    0.00   11414/11617       GrFillRect [7]
[63]     0.0    0.00    0.00   11617         GsPrepareDrawing [63]
                0.00    0.00     162/512         GdDestroyRegion [64]
                0.00    0.00     162/256         GsSetClipWindow [75]
                0.00    0.00     162/248         GdSetMode [77]
                0.00    0.00     162/163         GdSetUseBackground [88]
                0.00    0.00     162/163         GdSetDash [86]
                0.00    0.00     162/257         GdSetFillMode [73]
                0.00    0.00     162/162         GdSetTSOffset [89]
                0.00    0.00     162/163         GdSetFont [87]
                0.00    0.00     162/163         GdSetBackgroundColor [85]
                0.00    0.00     162/248         GdSetForegroundColor [76]
-----------------------------------------------
                0.00    0.00      94/512         GsResetScreenSaver [33]
                0.00    0.00     162/512         GsPrepareDrawing [63]
                0.00    0.00     256/512         GdSetClipRegion [72]
[64]     0.0    0.00    0.00     512         GdDestroyRegion [64]
-----------------------------------------------
                0.00    0.00       1/416         GsInitialize [41]
                0.00    0.00       4/416         GdSetCursor [46]
                0.00    0.00     163/416         GdSetBackgroundColor [85]
                0.00    0.00     248/416         GdSetForegroundColor [76]
[65]     0.0    0.00    0.00     416         GdFindColor [65]
-----------------------------------------------
                0.00    0.00       7/335         GrSetGCUseBackground [112]
                0.00    0.00      72/335         GrSetGCMode [102]
                0.00    0.00      72/335         GrCopyArea [55]
                0.00    0.00      84/335         GrSetGCForeground [100]
                0.00    0.00     100/335         GrDestroyGC [97]
[66]     0.0    0.00    0.00     335         GsFindGC [66]
-----------------------------------------------
                0.00    0.00       1/310         wm_client_window_remap [168]
                0.00    0.00     150/310         wm_update [25]
                0.00    0.00     159/310         wm_handle_event [17]
[67]     0.0    0.00    0.00     310         wm_find_window [67]
-----------------------------------------------
                0.00    0.00       1/301         GsInitialize [41]
                0.00    0.00     149/301         GrMoveCursor [29]
                0.00    0.00     151/301         GdReadMouse [69]
[68]     0.0    0.00    0.00     301         GdMoveMouse [68]
-----------------------------------------------
                0.00    0.00     295/295         GsCheckMouseEvent [27]
[69]     0.0    0.00    0.00     295         GdReadMouse [69]
                0.00    0.00     294/294         GPM_Read [70]
                0.00    0.00     151/301         GdMoveMouse [68]
-----------------------------------------------
                0.00    0.00     294/294         GdReadMouse [69]
[70]     0.0    0.00    0.00     294         GPM_Read [70]
-----------------------------------------------
                0.00    0.00       1/257         GdOpenScreen [51]
                0.00    0.00     256/257         GsSetClipWindow [75]
[71]     0.0    0.00    0.00     257         GdAllocRectRegion [71]
-----------------------------------------------
                0.00    0.00       1/257         GdOpenScreen [51]
                0.00    0.00     256/257         GsSetClipWindow [75]
[72]     0.0    0.00    0.00     257         GdSetClipRegion [72]
                0.00    0.00     256/512         GdDestroyRegion [64]
-----------------------------------------------
                0.00    0.00       1/257         GdOpenScreen [51]
                0.00    0.00      94/257         GsResetScreenSaver [33]
                0.00    0.00     162/257         GsPrepareDrawing [63]
[73]     0.0    0.00    0.00     257         GdSetFillMode [73]
-----------------------------------------------
                0.00    0.00     256/256         GsSetClipWindow [75]
[74]     0.0    0.00    0.00     256         GdAllocRegion [74]
-----------------------------------------------
                0.00    0.00      94/256         GsResetScreenSaver [33]
                0.00    0.00     162/256         GsPrepareDrawing [63]
[75]     0.0    0.00    0.00     256         GsSetClipWindow [75]
                0.00    0.00     256/257         GdAllocRectRegion [71]
                0.00    0.00     256/256         GdAllocRegion [74]
                0.00    0.00     256/257         GdSetClipRegion [72]
                0.00    0.00     164/164         GdSetRectRegion [81]
                0.00    0.00     164/164         GdSubtractRegion [82]
-----------------------------------------------
                0.00    0.00       1/248         GdOpenScreen [51]
                0.00    0.00      85/248         GsResetScreenSaver [33]
                0.00    0.00     162/248         GsPrepareDrawing [63]
[76]     0.0    0.00    0.00     248         GdSetForegroundColor [76]
                0.00    0.00     248/416         GdFindColor [65]
-----------------------------------------------
                0.00    0.00       1/248         GdOpenScreen [51]
                0.00    0.00      85/248         GsResetScreenSaver [33]
                0.00    0.00     162/248         GsPrepareDrawing [63]
[77]     0.0    0.00    0.00     248         GdSetMode [77]
-----------------------------------------------
                0.00    0.00     248/248         REGION_RegionOp [83]
[78]     0.0    0.00    0.00     248         REGION_SubtractNonO1 [78]
-----------------------------------------------
                0.00    0.00     203/203         corefont_drawtext [44]
[79]     0.0    0.00    0.00     203         gen_gettextbits [79]
-----------------------------------------------
                0.00    0.00       1/193         GrSetWindowCursor [47]
                0.00    0.00       1/193         GrRaiseWindow [157]
                0.00    0.00       2/193         GrNewWindow [127]
                0.00    0.00       2/193         GrMapWindow [52]
                0.00    0.00       2/193         GrSetFocus [128]
                0.00    0.00       2/193         GrReparentWindow [53]
                0.00    0.00       3/193         GrSelectEvents [123]
                0.00    0.00       4/193         GrSetWMProperties [54]
                0.00    0.00       7/193         GrGetWMProperties [111]
                0.00    0.00      25/193         GrGetWindowInfo [109]
                0.00    0.00      72/193         GrCopyArea [55]
                0.00    0.00      72/193         GrMoveWindow [32]
[80]     0.0    0.00    0.00     193         GsFindWindow [80]
-----------------------------------------------
                0.00    0.00     164/164         GsSetClipWindow [75]
[81]     0.0    0.00    0.00     164         GdSetRectRegion [81]
-----------------------------------------------
                0.00    0.00     164/164         GsSetClipWindow [75]
[82]     0.0    0.00    0.00     164         GdSubtractRegion [82]
                0.00    0.00     164/164         REGION_RegionOp [83]
-----------------------------------------------
                0.00    0.00     164/164         GdSubtractRegion [82]
[83]     0.0    0.00    0.00     164         REGION_RegionOp [83]
                0.00    0.00     248/248         REGION_SubtractNonO1 [78]
                0.00    0.00     164/164         REGION_SubtractO [84]
-----------------------------------------------
                0.00    0.00     164/164         REGION_RegionOp [83]
[84]     0.0    0.00    0.00     164         REGION_SubtractO [84]
-----------------------------------------------
                0.00    0.00       1/163         GdOpenScreen [51]
                0.00    0.00     162/163         GsPrepareDrawing [63]
[85]     0.0    0.00    0.00     163         GdSetBackgroundColor [85]
                0.00    0.00     163/416         GdFindColor [65]
-----------------------------------------------
                0.00    0.00       1/163         GdOpenScreen [51]
                0.00    0.00     162/163         GsPrepareDrawing [63]
[86]     0.0    0.00    0.00     163         GdSetDash [86]
-----------------------------------------------
                0.00    0.00       1/163         GdOpenScreen [51]
                0.00    0.00     162/163         GsPrepareDrawing [63]
[87]     0.0    0.00    0.00     163         GdSetFont [87]
-----------------------------------------------
                0.00    0.00       1/163         GdOpenScreen [51]
                0.00    0.00     162/163         GsPrepareDrawing [63]
[88]     0.0    0.00    0.00     163         GdSetUseBackground [88]
-----------------------------------------------
                0.00    0.00     162/162         GsPrepareDrawing [63]
[89]     0.0    0.00    0.00     162         GdSetTSOffset [89]
-----------------------------------------------
                0.00    0.00       1/156         GdOpenScreen [51]
                0.00    0.00       3/156         GdGetScreenInfo [121]
                0.00    0.00     152/156         GsHandleMouseStatus [28]
[90]     0.0    0.00    0.00     156         GdGetModifierInfo [90]
-----------------------------------------------
                0.00    0.00       1/156         GdOpenScreen [51]
                0.00    0.00       3/156         GdGetScreenInfo [121]
                0.00    0.00     152/156         GsHandleMouseStatus [28]
[91]     0.0    0.00    0.00     156         TTY_GetModifierInfo [91]
-----------------------------------------------
                0.00    0.00       3/154         GsWpRealizeWindow [50]
                0.00    0.00     151/154         GrMoveCursor [29]
[92]     0.0    0.00    0.00     154         GsCheckFocusWindow [92]
                0.00    0.00       4/6           GsWpSetFocus [114]
-----------------------------------------------
                0.00    0.00       3/154         GsWpRealizeWindow [50]
                0.00    0.00     151/154         GrMoveCursor [29]
[93]     0.0    0.00    0.00     154         GsCheckMouseWindow [93]
                0.00    0.00      58/60          GsDeliverGeneralEvent [105]
-----------------------------------------------
                0.00    0.00       1/151         GrSelectEvents [123]
                0.00    0.00       1/151         GrReparentWindow [53]
                0.00    0.00       1/151         GsWpSetFocus [114]
                0.00    0.00       1/151         GsWpUnrealizeWindow [58]
                0.00    0.00       3/151         GsWpRealizeWindow [50]
                0.00    0.00     144/151         DeliverUpdateMoveEventAndChildren [101]
[94]     0.0    0.00    0.00     151         GsDeliverUpdateEvent [94]
-----------------------------------------------
                0.00    0.00     145/145         GsSelect [26]
[95]     0.0    0.00    0.00     145         GdGetNextTimeout [95]
-----------------------------------------------
                0.00    0.00       1/101         main [1]
                0.00    0.00       7/101         nxPaintNCArea [11]
                0.00    0.00      21/101         nxDraw3dBox [21]
                0.00    0.00      72/101         GrMoveWindow [32]
[96]     0.0    0.00    0.00     101         GrNewGC [96]
-----------------------------------------------
                0.00    0.00       7/100         wm_redraw_ncarea [12]
                0.00    0.00       7/100         nxPaintNCArea [11]
                0.00    0.00      14/100         nxDraw3dOutset [22]
                0.00    0.00      72/100         GrMoveWindow [32]
[97]     0.0    0.00    0.00     100         GrDestroyGC [97]
                0.00    0.00     100/335         GsFindGC [66]
-----------------------------------------------
                0.00    0.00       1/94          GsWpUnrealizeWindow [58]
                0.00    0.00       1/94          GsRedrawScreen [57]
                0.00    0.00       3/94          GsWpRealizeWindow [50]
                0.00    0.00      89/94          GsExposeArea [36]
[98]     0.0    0.00    0.00      94         GsDeliverExposureEvent [98]
-----------------------------------------------
                0.00    0.00       1/85          wm_init [61]
                0.00    0.00      28/85          nxDraw3dOutset [22]
                0.00    0.00      56/85          nxPaintNCArea [11]
[99]     0.0    0.00    0.00      85         GrGetSysColor [99]
-----------------------------------------------
                0.00    0.00      42/84          nxDraw3dBox [21]
                0.00    0.00      42/84          nxPaintNCArea [11]
[100]    0.0    0.00    0.00      84         GrSetGCForeground [100]
                0.00    0.00      84/335         GsFindGC [66]
-----------------------------------------------
                0.00    0.00      72/72          GrMoveWindow [32]
[101]    0.0    0.00    0.00      72         DeliverUpdateMoveEventAndChildren [101]
                0.00    0.00     144/151         GsDeliverUpdateEvent [94]
-----------------------------------------------
                0.00    0.00      72/72          GrMoveWindow [32]
[102]    0.0    0.00    0.00      72         GrSetGCMode [102]
                0.00    0.00      72/335         GsFindGC [66]
-----------------------------------------------
                0.00    0.00      72/72          GrMoveWindow [32]
[103]    0.0    0.00    0.00      72         OffsetWindow [103]
-----------------------------------------------
                0.00    0.00      72/72          GdBlit [62]
[104]    0.0    0.00    0.00      72         linear32a_blit [104]
-----------------------------------------------
                0.00    0.00       2/60          GsWpSetFocus [114]
                0.00    0.00      58/60          GsCheckMouseWindow [93]
[105]    0.0    0.00    0.00      60         GsDeliverGeneralEvent [105]
-----------------------------------------------
                0.00    0.00       1/50          GdDecodeBMP [139]
                0.00    0.00       1/50          GdDecodeGIF [140]
                0.00    0.00       1/50          GdDecodeJPEG [142]
                0.00    0.00       1/50          GdDecodePNG [143]
                0.00    0.00       6/50          png_crc_error [1324]
                0.00    0.00       6/50          png_read_chunk_header [1461]
                0.00    0.00      34/50          png_crc_read [1326]
[106]    0.0    0.00    0.00      50         GdImageBufferRead [106]
-----------------------------------------------
                0.00    0.00       6/46          png_crc_error [1324]
                0.00    0.00       6/46          png_read_chunk_header [1461]
                0.00    0.00      34/46          png_crc_read [1326]
[107]    0.0    0.00    0.00      46         png_read_buffer [107]
-----------------------------------------------
                0.00    0.00       3/45          GsWpRealizeWindow [50]
                0.00    0.00      42/45          GsExposeArea [36]
[108]    0.0    0.00    0.00      45         GsDrawBorder [108]
-----------------------------------------------
                0.00    0.00       1/25          wm_container_buttonup [170]
                0.00    0.00       1/25          wm_client_window_remap [168]
                0.00    0.00       1/25          wm_new_client_window [49]
                0.00    0.00       3/25          wm_container_buttondown [169]
                0.00    0.00       7/25          wm_redraw_ncarea [12]
                0.00    0.00      12/25          main [1]
[109]    0.0    0.00    0.00      25         GrGetWindowInfo [109]
                0.00    0.00      25/193         GsFindWindow [80]
-----------------------------------------------
                0.00    0.00       7/7           wm_redraw_ncarea [12]
[110]    0.0    0.00    0.00       7         GrGetFocus [110]
-----------------------------------------------
                0.00    0.00       7/7           wm_redraw_ncarea [12]
[111]    0.0    0.00    0.00       7         GrGetWMProperties [111]
                0.00    0.00       7/193         GsFindWindow [80]
-----------------------------------------------
                0.00    0.00       7/7           nxPaintNCArea [11]
[112]    0.0    0.00    0.00       7         GrSetGCUseBackground [112]
                0.00    0.00       7/335         GsFindGC [66]
-----------------------------------------------
                0.00    0.00       7/7           corefont_drawtext [44]
[113]    0.0    0.00    0.00       7         gen_gettextsize [113]
-----------------------------------------------
                0.00    0.00       2/6           GrSetFocus [128]
                0.00    0.00       4/6           GsCheckFocusWindow [92]
[114]    0.0    0.00    0.00       6         GsWpSetFocus [114]
                0.00    0.00       2/60          GsDeliverGeneralEvent [105]
                0.00    0.00       1/151         GsDeliverUpdateEvent [94]
-----------------------------------------------
                0.00    0.00       6/6           wm_handle_event [17]
[115]    0.0    0.00    0.00       6         wm_container_exposure [115]
-----------------------------------------------
                0.00    0.00       4/4           GdGetButtonInfo [117]
[116]    0.0    0.00    0.00       4         GPM_GetButtonInfo [116]
-----------------------------------------------
                0.00    0.00       1/4           GdOpenScreen [51]
                0.00    0.00       3/4           GdGetScreenInfo [121]
[117]    0.0    0.00    0.00       4         GdGetButtonInfo [117]
                0.00    0.00       4/4           GPM_GetButtonInfo [116]
-----------------------------------------------
                0.00    0.00       1/4           GrGetScreenInfo [154]
                0.00    0.00       1/4           GdOpenScreen [51]
                0.00    0.00       2/4           GdCreateFont [126]
[118]    0.0    0.00    0.00       4         GdGetCursorPos [118]
-----------------------------------------------
                0.00    0.00       1/4           GdDecodeBMP [139]
                0.00    0.00       1/4           GdDecodeGIF [140]
                0.00    0.00       1/4           GdDecodeJPEG [142]
                0.00    0.00       1/4           GdDecodePNG [143]
[119]    0.0    0.00    0.00       4         GdImageBufferSeekTo [119]
-----------------------------------------------
                0.00    0.00       1/4           GdOpenScreen [51]
                0.00    0.00       3/4           GdGetScreenInfo [121]
[120]    0.0    0.00    0.00       4         gen_getscreeninfo [120]
-----------------------------------------------
                0.00    0.00       1/3           GrGetScreenInfo [154]
                0.00    0.00       2/3           GdCreateFont [126]
[121]    0.0    0.00    0.00       3         GdGetScreenInfo [121]
                0.00    0.00       3/4           gen_getscreeninfo [120]
                0.00    0.00       3/4           GdGetButtonInfo [117]
                0.00    0.00       3/156         TTY_GetModifierInfo [91]
                0.00    0.00       3/156         GdGetModifierInfo [90]
-----------------------------------------------
                0.00    0.00       3/3           GsCheckKeyboardEvent [56]
[122]    0.0    0.00    0.00       3         GdReadKeyboard [122]
-----------------------------------------------
                0.00    0.00       1/3           main [1]
                0.00    0.00       1/3           wm_init [61]
                0.00    0.00       1/3           wm_new_client_window [49]
[123]    0.0    0.00    0.00       3         GrSelectEvents [123]
                0.00    0.00       3/193         GsFindWindow [80]
                0.00    0.00       1/151         GsDeliverUpdateEvent [94]
-----------------------------------------------
                0.00    0.00       3/3           GsCheckKeyboardEvent [56]
[124]    0.0    0.00    0.00       3         TTY_Read [124]
-----------------------------------------------
                0.00    0.00       1/3           wm_init [61]
                0.00    0.00       2/3           wm_new_client_window [49]
[125]    0.0    0.00    0.00       3         wm_add_window [125]
-----------------------------------------------
                0.00    0.00       1/2           GsInitialize [41]
                0.00    0.00       1/2           GdOpenScreen [51]
[126]    0.0    0.00    0.00       2         GdCreateFont [126]
                0.00    0.00       2/4           GdGetCursorPos [118]
                0.00    0.00       2/3           GdGetScreenInfo [121]
-----------------------------------------------
                0.00    0.00       1/2           GrNewWindowEx [60]
                0.00    0.00       1/2           wm_new_client_window [49]
[127]    0.0    0.00    0.00       2         GrNewWindow [127]
                0.00    0.00       2/193         GsFindWindow [80]
                0.00    0.00       2/2           NewWindow [132]
-----------------------------------------------
                0.00    0.00       1/2           wm_container_buttondown [169]
                0.00    0.00       1/2           wm_new_client_window [49]
[128]    0.0    0.00    0.00       2         GrSetFocus [128]
                0.00    0.00       2/193         GsFindWindow [80]
                0.00    0.00       2/6           GsWpSetFocus [114]
-----------------------------------------------
                0.00    0.00       2/2           GsHandleMouseStatus [28]
[129]    0.0    0.00    0.00       2         GsDeliverButtonEvent [129]
                0.00    0.00       2/2           GsGetTickCount [131]
-----------------------------------------------
                0.00    0.00       1/2           GsInitialize [41]
                0.00    0.00       1/2           GrSetWindowCursor [47]
[130]    0.0    0.00    0.00       2         GsFindCursor [130]
-----------------------------------------------
                0.00    0.00       2/2           GsDeliverButtonEvent [129]
[131]    0.0    0.00    0.00       2         GsGetTickCount [131]
-----------------------------------------------
                0.00    0.00       2/2           GrNewWindow [127]
[132]    0.0    0.00    0.00       2         NewWindow [132]
-----------------------------------------------
                0.00    0.00       1/2           fb_setportrait [165]
                0.00    0.00       1/2           fb_open [164]
[133]    0.0    0.00    0.00       2         set_subdriver [133]
                0.00    0.00       1/1           linear32a_init [166]
-----------------------------------------------
                0.00    0.00       1/1           GsTerminate [158]
[134]    0.0    0.00    0.00       1         GPM_Close [134]
-----------------------------------------------
                0.00    0.00       1/1           GdOpenMouse [149]
[135]    0.0    0.00    0.00       1         GPM_Open [135]
-----------------------------------------------
                0.00    0.00       1/1           GsTerminate [158]
[136]    0.0    0.00    0.00       1         GdCloseKeyboard [136]
-----------------------------------------------
                0.00    0.00       1/1           GsTerminate [158]
[137]    0.0    0.00    0.00       1         GdCloseMouse [137]
-----------------------------------------------
                0.00    0.00       1/1           GsTerminate [158]
[138]    0.0    0.00    0.00       1         GdCloseScreen [138]
-----------------------------------------------
                0.00    0.00       1/1           GdDecodeImage [141]
[139]    0.0    0.00    0.00       1         GdDecodeBMP [139]
                0.00    0.00       1/4           GdImageBufferSeekTo [119]
                0.00    0.00       1/50          GdImageBufferRead [106]
-----------------------------------------------
                0.00    0.00       1/1           GdDecodeImage [141]
[140]    0.0    0.00    0.00       1         GdDecodeGIF [140]
                0.00    0.00       1/4           GdImageBufferSeekTo [119]
                0.00    0.00       1/50          GdImageBufferRead [106]
-----------------------------------------------
                0.00    0.00       1/1           GdLoadImageFromFile [147]
[141]    0.0    0.00    0.00       1         GdDecodeImage [141]
                0.00    0.00       1/1           GdDecodeBMP [139]
                0.00    0.00       1/1           GdDecodeGIF [140]
                0.00    0.00       1/1           GdDecodeJPEG [142]
                0.00    0.00       1/1           GdDecodePNG [143]
                0.00    0.00       1/1           GdItemAlloc [145]
                0.00    0.00       1/1           GdListAdd [146]
-----------------------------------------------
                0.00    0.00       1/1           GdDecodeImage [141]
[142]    0.0    0.00    0.00       1         GdDecodeJPEG [142]
                0.00    0.00       1/4           GdImageBufferSeekTo [119]
                0.00    0.00       1/50          GdImageBufferRead [106]
-----------------------------------------------
                0.00    0.00       1/1           GdDecodeImage [141]
[143]    0.0    0.00    0.00       1         GdDecodePNG [143]
                0.00    0.00       1/4           GdImageBufferSeekTo [119]
                0.00    0.00       1/50          GdImageBufferRead [106]
-----------------------------------------------
                0.00    0.00       1/1           GrGetImageInfo [153]
[144]    0.0    0.00    0.00       1         GdGetImageInfo [144]
-----------------------------------------------
                0.00    0.00       1/1           GdDecodeImage [141]
[145]    0.0    0.00    0.00       1         GdItemAlloc [145]
-----------------------------------------------
                0.00    0.00       1/1           GdDecodeImage [141]
[146]    0.0    0.00    0.00       1         GdListAdd [146]
-----------------------------------------------
                0.00    0.00       1/1           GrLoadImageFromFile [155]
[147]    0.0    0.00    0.00       1         GdLoadImageFromFile [147]
                0.00    0.00       1/1           GdDecodeImage [141]
-----------------------------------------------
                0.00    0.00       1/1           GsInitialize [41]
[148]    0.0    0.00    0.00       1         GdOpenKeyboard [148]
                0.00    0.00       1/1           TTY_Open [162]
-----------------------------------------------
                0.00    0.00       1/1           GsInitialize [41]
[149]    0.0    0.00    0.00       1         GdOpenMouse [149]
                0.00    0.00       1/1           GPM_Open [135]
                0.00    0.00       1/1           MOU_GetDefaultAccel [160]
-----------------------------------------------
                0.00    0.00       1/1           GsInitialize [41]
[150]    0.0    0.00    0.00       1         GdRestrictMouse [150]
-----------------------------------------------
                0.00    0.00       1/1           GsInitialize [41]
[151]    0.0    0.00    0.00       1         GdSetPortraitMode [151]
                0.00    0.00       1/1           fb_setportrait [165]
-----------------------------------------------
                0.00    0.00       1/1           GdOpenScreen [51]
[152]    0.0    0.00    0.00       1         GdSetStippleBitmap [152]
-----------------------------------------------
                0.00    0.00       1/1           main [1]
[153]    0.0    0.00    0.00       1         GrGetImageInfo [153]
                0.00    0.00       1/1           GdGetImageInfo [144]
-----------------------------------------------
                0.00    0.00       1/1           wm_new_client_window [49]
[154]    0.0    0.00    0.00       1         GrGetScreenInfo [154]
                0.00    0.00       1/4           GdGetCursorPos [118]
                0.00    0.00       1/3           GdGetScreenInfo [121]
-----------------------------------------------
                0.00    0.00       1/1           main [1]
[155]    0.0    0.00    0.00       1         GrLoadImageFromFile [155]
                0.00    0.00       1/1           GdLoadImageFromFile [147]
-----------------------------------------------
                0.00    0.00       1/1           GsInitialize [41]
[156]    0.0    0.00    0.00       1         GrNewCursor [156]
-----------------------------------------------
                0.00    0.00       1/1           wm_container_buttondown [169]
[157]    0.0    0.00    0.00       1         GrRaiseWindow [157]
                0.00    0.00       1/193         GsFindWindow [80]
-----------------------------------------------
                0.00    0.00       1/1           GsCheckKeyboardEvent [56]
[158]    0.0    0.00    0.00       1         GsTerminate [158]
                0.00    0.00       1/1           fb_close [163]
                0.00    0.00       1/1           GdCloseScreen [138]
                0.00    0.00       1/1           TTY_Close [161]
                0.00    0.00       1/1           GdCloseKeyboard [136]
                0.00    0.00       1/1           GPM_Close [134]
                0.00    0.00       1/1           GdCloseMouse [137]
-----------------------------------------------
                0.00    0.00       1/1           GrSetWMProperties [54]
[159]    0.0    0.00    0.00       1         GsWpNotifyActivate [159]
-----------------------------------------------
                0.00    0.00       1/1           GdOpenMouse [149]
[160]    0.0    0.00    0.00       1         MOU_GetDefaultAccel [160]
-----------------------------------------------
                0.00    0.00       1/1           GsTerminate [158]
[161]    0.0    0.00    0.00       1         TTY_Close [161]
-----------------------------------------------
                0.00    0.00       1/1           GdOpenKeyboard [148]
[162]    0.0    0.00    0.00       1         TTY_Open [162]
-----------------------------------------------
                0.00    0.00       1/1           GsTerminate [158]
[163]    0.0    0.00    0.00       1         fb_close [163]
-----------------------------------------------
                0.00    0.00       1/1           GdOpenScreen [51]
[164]    0.0    0.00    0.00       1         fb_open [164]
                0.00    0.00       1/1           select_fb_subdriver [167]
                0.00    0.00       1/2           set_subdriver [133]
-----------------------------------------------
                0.00    0.00       1/1           GdSetPortraitMode [151]
[165]    0.0    0.00    0.00       1         fb_setportrait [165]
                0.00    0.00       1/2           set_subdriver [133]
-----------------------------------------------
                0.00    0.00       1/1           set_subdriver [133]
[166]    0.0    0.00    0.00       1         linear32a_init [166]
-----------------------------------------------
                0.00    0.00       1/1           fb_open [164]
[167]    0.0    0.00    0.00       1         select_fb_subdriver [167]
-----------------------------------------------
                0.00    0.00       1/1           wm_update [25]
[168]    0.0    0.00    0.00       1         wm_client_window_remap [168]
                0.00    0.00       1/310         wm_find_window [67]
                0.00    0.00       1/25          GrGetWindowInfo [109]
-----------------------------------------------
                0.00    0.00       1/1           wm_handle_event [17]
[169]    0.0    0.00    0.00       1         wm_container_buttondown [169]
                0.00    0.00       3/25          GrGetWindowInfo [109]
                0.00    0.00       1/2           GrSetFocus [128]
                0.00    0.00       1/1           GrRaiseWindow [157]
-----------------------------------------------
                0.00    0.00       1/1           wm_handle_event [17]
[170]    0.0    0.00    0.00       1         wm_container_buttonup [170]
                0.00    0.00       1/25          GrGetWindowInfo [109]
-----------------------------------------------

 This table describes the call tree of the program, and was sorted by
 the total amount of time spent in each function and its children.

 Each entry in this table consists of several lines.  The line with the
 index number at the left hand margin lists the current function.
 The lines above it list the functions that called this function,
 and the lines below it list the functions this one called.
 This line lists:
     index	A unique number given to each element of the table.
		Index numbers are sorted numerically.
		The index number is printed next to every function name so
		it is easier to look up where the function in the table.

     % time	This is the percentage of the `total' time that was spent
		in this function and its children.  Note that due to
		different viewpoints, functions excluded by options, etc,
		these numbers will NOT add up to 100%.

     self	This is the total amount of time spent in this function.

     children	This is the total amount of time propagated into this
		function by its children.

     called	This is the number of times the function was called.
		If the function called itself recursively, the number
		only includes non-recursive calls, and is followed by
		a `+' and the number of recursive calls.

     name	The name of the current function.  The index number is
		printed after it.  If the function is a member of a
		cycle, the cycle number is printed between the
		function's name and the index number.


 For the function's parents, the fields have the following meanings:

     self	This is the amount of time that was propagated directly
		from the function into this parent.

     children	This is the amount of time that was propagated from
		the function's children into this parent.

     called	This is the number of times this parent called the
		function `/' the total number of times the function
		was called.  Recursive calls to the function are not
		included in the number after the `/'.

     name	This is the name of the parent.  The parent's index
		number is printed after it.  If the parent is a
		member of a cycle, the cycle number is printed between
		the name and the index number.

 If the parents of the function cannot be determined, the word
 `<spontaneous>' is printed in the `name' field, and all the other
 fields are blank.

 For the function's children, the fields have the following meanings:

     self	This is the amount of time that was propagated directly
		from the child into the function.

     children	This is the amount of time that was propagated from the
		child's children to the function.

     called	This is the number of times the function called
		this child `/' the total number of times the child
		was called.  Recursive calls by the child are not
		listed in the number after the `/'.

     name	This is the name of the child.  The child's index
		number is printed after it.  If the child is a
		member of a cycle, the cycle number is printed
		between the name and the index number.

 If there are any cycles (circles) in the call graph, there is an
 entry for the cycle-as-a-whole.  This entry shows who called the
 cycle (as parents) and the members of the cycle (as children.)
 The `+' recursive calls entry shows the number of function calls that
 were internal to the cycle, and the calls entry for each member shows,
 for that member, how many times it was called from other members of
 the cycle.


Index by function name

 [101] DeliverUpdateMoveEventAndChildren [81] GdSetRectRegion [57] GsRedrawScreen
 [134] GPM_Close             [152] GdSetStippleBitmap     [33] GsResetScreenSaver
 [116] GPM_GetButtonInfo      [89] GdSetTSOffset          [26] GsSelect
 [135] GPM_Open               [88] GdSetUseBackground     [75] GsSetClipWindow
  [70] GPM_Read               [35] GdShowCursor          [158] GsTerminate
  [71] GdAllocRectRegion      [82] GdSubtractRegion      [159] GsWpNotifyActivate
  [74] GdAllocRegion          [42] GdText                 [50] GsWpRealizeWindow
  [62] GdBlit                 [55] GrCopyArea            [114] GsWpSetFocus
  [38] GdCheckCursor          [97] GrDestroyGC            [58] GsWpUnrealizeWindow
  [59] GdClipArea              [4] GrDrawImageToFit      [160] MOU_GetDefaultAccel
  [39] GdClipPoint             [7] GrFillRect            [132] NewWindow
 [136] GdCloseKeyboard       [110] GrGetFocus            [103] OffsetWindow
 [137] GdCloseMouse          [153] GrGetImageInfo         [83] REGION_RegionOp
 [138] GdCloseScreen          [10] GrGetNextEvent         [78] REGION_SubtractNonO1
 [126] GdCreateFont          [154] GrGetScreenInfo        [84] REGION_SubtractO
 [139] GdDecodeBMP            [99] GrGetSysColor         [161] TTY_Close
 [140] GdDecodeGIF           [111] GrGetWMProperties      [91] TTY_GetModifierInfo
 [141] GdDecodeImage         [109] GrGetWindowInfo       [162] TTY_Open
 [142] GdDecodeJPEG           [19] GrLine                [124] TTY_Read
 [143] GdDecodePNG           [155] GrLoadImageFromFile    [44] corefont_drawtext
  [64] GdDestroyRegion        [52] GrMapWindow            [45] drawbitmap
   [2] GdDrawImage            [29] GrMoveCursor           [13] drawcol
   [3] GdDrawImageToFit       [32] GrMoveWindow           [18] drawrow
   [6] GdFillRect            [156] GrNewCursor           [163] fb_close
  [65] GdFindColor            [96] GrNewGC               [164] fb_open
  [37] GdFixCursor           [127] GrNewWindow           [165] fb_setportrait
 [117] GdGetButtonInfo        [60] GrNewWindowEx           [8] gen_fillrect
 [118] GdGetCursorPos         [40] GrOpen                [120] gen_getscreeninfo
 [144] GdGetImageInfo        [157] GrRaiseWindow          [79] gen_gettextbits
  [90] GdGetModifierInfo      [23] GrRect                [113] gen_gettextsize
  [95] GdGetNextTimeout       [53] GrReparentWindow       [16] inflate_fast
 [121] GdGetScreenInfo       [123] GrSelectEvents        [104] linear32a_blit
  [34] GdHideCursor          [128] GrSetFocus              [5] linear32a_drawhorzline
 [106] GdImageBufferRead     [100] GrSetGCForeground       [9] linear32a_drawpixel
 [119] GdImageBufferSeekTo   [102] GrSetGCMode            [15] linear32a_drawvertline
 [145] GdItemAlloc           [112] GrSetGCUseBackground  [166] linear32a_init
  [20] GdLine                 [54] GrSetWMProperties      [14] linear32a_readpixel
 [146] GdListAdd              [47] GrSetWindowCursor      [21] nxDraw3dBox
 [147] GdLoadImageFromFile    [43] GrText                 [22] nxDraw3dOutset
  [30] GdMoveCursor           [48] GsCheckCursor          [11] nxPaintNCArea
  [68] GdMoveMouse            [92] GsCheckFocusWindow    [107] png_read_buffer
 [148] GdOpenKeyboard         [56] GsCheckKeyboardEvent  [167] select_fb_subdriver
 [149] GdOpenMouse            [27] GsCheckMouseEvent     [133] set_subdriver
  [51] GdOpenScreen           [93] GsCheckMouseWindow    [125] wm_add_window
 [122] GdReadKeyboard        [129] GsDeliverButtonEvent  [168] wm_client_window_remap
  [69] GdReadMouse            [98] GsDeliverExposureEvent [169] wm_container_buttondown
  [24] GdRect                [105] GsDeliverGeneralEvent [170] wm_container_buttonup
 [150] GdRestrictMouse        [94] GsDeliverUpdateEvent  [115] wm_container_exposure
  [85] GdSetBackgroundColor  [108] GsDrawBorder           [31] wm_container_mousemoved
  [72] GdSetClipRegion        [36] GsExposeArea           [67] wm_find_window
  [46] GdSetCursor           [130] GsFindCursor           [17] wm_handle_event
  [86] GdSetDash              [66] GsFindGC               [61] wm_init
  [73] GdSetFillMode          [80] GsFindWindow           [49] wm_new_client_window
  [87] GdSetFont             [131] GsGetTickCount         [12] wm_redraw_ncarea
  [76] GdSetForegroundColor   [28] GsHandleMouseStatus    [25] wm_update
  [77] GdSetMode              [41] GsInitialize
 [151] GdSetPortraitMode      [63] GsPrepareDrawing

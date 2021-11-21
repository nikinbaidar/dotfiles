/* See LICENSE file for copyright and license details. */

/* appearance */
static const unsigned int borderpx  = 2;        /* border pixel of windows */
static const unsigned int gappx     = 5;        /* gaps between windows */
static const unsigned int snap      = 32;       /* snap pixel */
static const int showbar            = 1;        /* 0 means no bar */
static const int topbar             = 1;        /* 0 means bottom bar */
static const char *fonts[]          = { "monospace:size=10" };
static const char dmenufont[]       = "monospace:size=10";
static const char col_yellow2[]     = "#fabd2f";
static const char col_cyan2[]       = "#83a598";
static const char col_gray1[]       = "#222222";
static const char col_gray3[]       = "#e3e3e3";
static const char col_gray4[]       = "#eeeeee";
static const char col_cyan[]        = "#005577";
static const char *colors[][3]      = {
    /*               fg         bg         border   */
    [SchemeNorm] = { col_gray3, col_gray1, col_cyan2 },
    [SchemeSel]  = { col_gray4, col_cyan,  col_yellow2 },
};

typedef struct {
    const char *name;
    const void *cmd;
} Sp;
const char *spcmd1[] = {"xterm", "-name", "spterm", "-g", "120x34", NULL };
const char *spcmd2[] = {"xterm", "-name", "spdiary", "-g", "144x41", "-e", \
                        "vim ${HOME}/Notes/Archives/CodeDiary.md", NULL };
const char *spcmd3[] = {"xterm", "-name", "spmusic", "-g", "144x41", "-e", "cmus", NULL };
const char *spcmd4[] = {"keepassxc", NULL };
const char *spcmd5[] = {"viber", NULL };
static Sp scratchpads[] = {
    /* name          cmd  */
    {"spterm",      spcmd1},
    {"spranger",    spcmd2},
    {"spmusic",     spcmd3},
    {"keepassxc",   spcmd4},
    {"viber",       spcmd5},
};

/* tagging */
static const char *tags[] = { "1", "2", "3", "4", "5", "6", "7", "8", "9" };

static const Rule rules[] = {
    /* xprop(1):
     *  WM_CLASS(STRING) = instance, class
     *  WM_NAME(STRING) = title
     */
    /* class      instance      title       tags mask     isfloating   monitor    float x,y,w,h         floatborderpx */
    { "Gimp",     NULL,         NULL,       1 << 7,       0,           -1,        0,0,0,0,              0 },
	{ "Firefox",  NULL,         NULL,       1 << 8,       0,           -1,        50,50,500,500,        5 },
    { NULL,       "spterm",     NULL,       SPTAG(0),     1,           -1,        310,160,640,420,      1 },
    { NULL,       "spdiary",    NULL,       SPTAG(1),     1,           -1,        310,160,640,420,      1 },
    { NULL,       "spmusic",    NULL,       SPTAG(2),     1,           -1,        310,160,640,420,      0 },
    { NULL,       "keepassxc",  NULL,       SPTAG(3),     0,           -1,        0,0,0,0,              0 },
    { NULL,       "viber",      NULL,       SPTAG(4),     0,           -1,        0,0,0,0,              0 },

};

/* layout(s) */
static const float mfact     = 0.50;
static const int nmaster     = 1;
static const int resizehints = 0;
static const int lockfullscreen = 1;

static const Layout layouts[] = {
    /* symbol     arrange function */
    { "[]=",      tile },    /* first entry is default */
    { "><>",      NULL },    /* no layout function means floating behavior */
    { "[M]",      monocle },
};

/* key definitions */
#define MODKEY Mod4Mask
#define TAGKEYS(KEY,TAG) \
 { MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
 { MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
 { MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
 { MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

/* commands */
/* dmenu */
static char dmenumon[2] = "0";
static const char *dmenucmd[] = { "dmenu_run", "-m", dmenumon, "-fn", \
                dmenufont, "-nb", col_gray1, "-nf", col_gray3, "-sb", \
                col_cyan, "-sf", col_gray4, NULL };

static const char *termcmd[]  = { "xterm", NULL };
static const char *screenshotcmd[] = { "~/Scripts/grabScreenSelection", NULL };
static const char *noop[] = { "~/Scripts/thisScriptDoesNothing", NULL };

static Key keys[] = {
    /* modifier              key        function        argument */
    { MODKEY,                XK_p,      spawn,          {.v = dmenucmd } },
    { MODKEY,                XK_Return, spawn,          {.v = termcmd } },
    { MODKEY,                XK_x,      spawn,          {.v = screenshotcmd } },
    { MODKEY,                XK_d,      spawn,          {.v = noop } },
    { MODKEY,                XK_f,      togglefullscr,  {0} },
    { MODKEY,                XK_grave,  togglescratch,  {.ui = 0 } },
    { MODKEY,                XK_n,      togglescratch,  {.ui = 1 } },
    { MODKEY,                XK_m,      togglescratch,  {.ui = 2 } },
    { MODKEY,                XK_s,      togglescratch,  {.ui = 3 } },
    { MODKEY,                XK_v,      togglescratch,  {.ui = 4 } },
    { MODKEY|ShiftMask,      XK_Return, zoom,           {0} },
    { MODKEY,                XK_b,      togglebar,      {0} },
    { MODKEY,                XK_j,      focusstack,     {.i = +1 } },
    { MODKEY,                XK_k,      focusstack,     {.i = -1 } },
    { MODKEY,                XK_i,      incnmaster,     {.i = +1 } },
    { MODKEY,                XK_r,      incnmaster,     {.i = -1 } },
    { MODKEY,                XK_h,      setmfact,       {.f = -0.05} },
    { MODKEY,                XK_l,      setmfact,       {.f = +0.05} },
    { MODKEY,                XK_Tab,    view,           {0} },
    { MODKEY,                XK_q,      killclient,     {0} },
    { MODKEY,                XK_t,      setlayout,      {.v = &layouts[0]} },
    { MODKEY|ShiftMask,      XK_f,      setlayout,      {.v = &layouts[1]} },
    { MODKEY,                XK_space,  setlayout,      {0} },
    { MODKEY|ShiftMask,      XK_space,  togglefloating, {0} },
    { MODKEY,                XK_0,      view,           {.ui = ~0 } },
    { MODKEY|ShiftMask,      XK_0,      tag,            {.ui = ~0 } },
    { MODKEY,                XK_comma,  focusmon,       {.i = -1 } },
    { MODKEY,                XK_period, focusmon,       {.i = +1 } },
    { MODKEY|ShiftMask,      XK_comma,  tagmon,         {.i = -1 } },
    { MODKEY|ShiftMask,      XK_period, tagmon,         {.i = +1 } },
    { MODKEY,                XK_minus,  setgaps,        {.i = +5 } },
    { MODKEY,                XK_equal,  setgaps,        {.i = -5 } },
    { MODKEY|ShiftMask,      XK_equal,  setgaps,        {.i = 0  } },
    TAGKEYS(                 XK_1,                      0)
    TAGKEYS(                 XK_2,                      1)
    TAGKEYS(                 XK_3,                      2)
    TAGKEYS(                 XK_4,                      3)
    TAGKEYS(                 XK_5,                      4)
    TAGKEYS(                 XK_6,                      5)
    TAGKEYS(                 XK_7,                      6)
    TAGKEYS(                 XK_8,                      7)
    TAGKEYS(                 XK_9,                      8)
    { MODKEY|ShiftMask,      XK_q,      quit,           {0} },
};

/* button definitions:
 * click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle,
 * ClkClientWin, or ClkRootWin
 */

static Button buttons[] = {
    /* click            event mask      button     function        argument */
    { ClkClientWin,     MODKEY,         Button1,   movemouse,      {0} },
    { ClkClientWin,     MODKEY,         Button2,   togglefloating, {0} },
    { ClkClientWin,     MODKEY,         Button3,   resizemouse,    {0} },
    { ClkTagBar,        0,              Button1,   view,           {0} },
};

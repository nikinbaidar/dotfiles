/* See LICENSE file for copyright and license details. */

/* appearance */
static const unsigned int borderpx  = 2;    
static const unsigned int snap      = 32; 
static const unsigned int gappx     = 5;     
static const int showbar            = 1;      
static const int topbar             = 1;        
static const char *fonts[]          = { "monospace:size=10" };
static const char dmenufont[]       = "monospace:size=10";
static const char col_gray1[]       = "#222222";
static const char col_gray2[]       = "#bbbbbb";
static const char col_gray3[]       = "#eeeeee";
static const char col_cyan[]        = "#005073";
static const char *colors[][3]      = {
        /*               fg         bg         border   */
        [SchemeNorm] = { col_gray3, "#1d2021", "#b2be85" },
        [SchemeSel]  = { col_gray3, col_cyan, "#EAAA00" },
};

typedef struct {
        const char *name;
        const void *cmd;
} Sp;
const char *spcmd1[] = {"viber", NULL };
static Sp scratchpads[] = {
    /* name      cmd  */
    {"viber",    spcmd1},
};

/* tagging */
static const char *tags[] = { "1", "2", "3", "4", "5", "6", "7", "8", "9" };

static const Rule rules[] = {
    /* xprop(1):
     *      WM_CLASS(STRING) = instance, class
     *      WM_NAME(STRING) = title
     */
    /* class           instance    title  tags mask  isfloating   monitor */
    { "AFNI",          NULL,       NULL,  1 << 7,       1,           -1 },
    { "TopLevelShell", NULL,       NULL,  1 << 7,       1,           -1 },
    { NULL,            "viber",    NULL,  SPTAG(0),     0,           -1 },
};

/* layout(s) */
static const float mfact        = 0.55; 
static const int nmaster        = 1;   
static const int resizehints    = 0;   
static const int lockfullscreen = 1; /* force focus on the fullscreen window */

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

/* commands */
static char dmenumon[2] = "0";
static const char *dmenucmd[] = { "dmenu_run", "-m", dmenumon, "-fn",      \
    dmenufont, "-nb", col_gray1, "-nf", col_gray3, "-sb", col_cyan, "-sf", \
    col_gray3, NULL };
static const char *termcmd[]       = { "st", "tmux", NULL };
static const char *nop[]           = { "no_operation", NULL };
static const char *screenshotcmd[] = { "grabScreenSelection", NULL };

/* Monitor Setup */
static const char *dualmon[]        = { "dualmonitor", NULL };
static const char *externalmon[]    = { "singlemonitor", NULL };

static Key keys[] = {
/* modifier           key              function        argument */
{ MODKEY,             XK_p,            spawn,          {.v = dmenucmd } },
{ MODKEY,             XK_Return,       spawn,          {.v = termcmd } },
{ MODKEY,             XK_b,            togglebar,      {0} },
{ MODKEY,             XK_d,            spawn,          {.v = nop } },
{ MODKEY,             XK_x,            spawn,          {.v = screenshotcmd } },
{ MODKEY,             XK_bracketright, spawn,          {.v = dualmon } },
{ MODKEY,             XK_bracketleft,  spawn,          {.v = externalmon } },
{ MODKEY,             XK_j,            focusstack,     {.i = +1 } },
{ MODKEY,             XK_k,            focusstack,     {.i = -1 } },
{ MODKEY,             XK_i,            incnmaster,     {.i = +1 } },
{ MODKEY,             XK_r,            incnmaster,     {.i = -1 } },
{ MODKEY,             XK_h,            setmfact,       {.f = -0.05} },
{ MODKEY,             XK_l,            setmfact,       {.f = +0.05} },
{ MODKEY,             XK_f,            zoom,           {0} },
{ MODKEY,             XK_Tab,          view,           {0} },
{ MODKEY,             XK_q,            killclient,     {0} },
{ MODKEY,             XK_t,            setlayout,      {.v = &layouts[0]} },
{ MODKEY,             XK_m,            setlayout,      {.v = &layouts[1]} },
{ MODKEY|ShiftMask,   XK_f,            setlayout,      {.v = &layouts[2]} },
{ MODKEY,             XK_v,            togglescratch,  {.ui = 0 } },
{ MODKEY,             XK_space,        setlayout,      {0} },
{ MODKEY|ShiftMask,   XK_space,        togglefloating, {0} },
{ MODKEY,             XK_0,            view,           {.ui = ~0 } },
{ MODKEY,             XK_comma,        focusmon,       {.i = -1 } },
{ MODKEY,             XK_period,       focusmon,       {.i = +1 } },
{ MODKEY|ShiftMask,   XK_comma,        tagmon,         {.i = -1 } },
{ MODKEY|ShiftMask,   XK_period,       tagmon,         {.i = +1 } },
TAGKEYS(              XK_1,                            0)
TAGKEYS(              XK_2,                            1)
TAGKEYS(              XK_3,                            2)
TAGKEYS(              XK_4,                            3)
TAGKEYS(              XK_5,                            4)
TAGKEYS(              XK_6,                            5)
TAGKEYS(              XK_7,                            6)
TAGKEYS(              XK_8,                            7)
TAGKEYS(              XK_9,                            8)
{ MODKEY|ShiftMask,   XK_q,            quit,           {0} },
};

/* button definitions */
/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle,
 * ClkClientWin, or ClkRootWin */
static Button buttons[] = {
    /* click          event mask    button          function        argument */
    { ClkClientWin,   MODKEY,       Button1,        movemouse,      {0} },
    { ClkClientWin,   MODKEY,       Button2,        togglefloating, {0} },
    { ClkClientWin,   MODKEY,       Button3,        resizemouse,    {0} },
    { ClkTagBar,      0,            Button1,        view,           {0} },
};

/* user and group to drop privileges to */
static const char *user  = "howoz";
static const char *group = "howoz";

static const char *colorname[NUMCOLS] = {
	[INIT] =	"#282828",	/* after initialization */
	[INPUT] =	"#3c3836",	/* during input */
	[FAILED] =	"#cc241d",	/* wrong password */
	[CAPS] =	"#1d2021"	/* capslock color*/
};

/* treat a cleared input like a wrong password (color) */
static const int failonclear = 0;

/* time in seconds before the monitor shuts down */
static const int monitortime = 5;

/* default message */
static const char * message = "Locked at [the end of time]";

/* text color */
static const char * text_color = "#bdae93";

/* message font */
static const char * font_name = "-lucy-tewi-medium-r-normal--11-90-100-100-c-60-iso10646-1";

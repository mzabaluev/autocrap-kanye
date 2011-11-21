#include "kanye.h"

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "config.h"

#ifdef HAVE_LIBNOTIFY
#include "kanye-notify.h"
#endif

#include "l10n.h"

typedef enum {
  KANYE_OUTPUT_STDOUT,
  KANYE_OUTPUT_NOTIFY,
} KanyeOutput;

static KanyeOutput kanye_output = KANYE_OUTPUT_DEFAULT;

static int kanye_been_on_stage = 0;

void kanye_storm_stage()
{
    char *kanye_output_env;

    if (kanye_been_on_stage) {
        fputs("Kanye: I ain't gonna do it twice for you, man!\n", stderr);
        return;
    }
    kanye_been_on_stage = 1;

#ifdef ENABLE_NLS
    bindtextdomain(PACKAGE, LOCALEDIR);
#endif

    kanye_output_env = getenv("KANYE_OUTPUT");

    if (kanye_output_env == NULL) {
        /* Use the default */
    } else if (strcmp(kanye_output_env, "stdout") == 0) {
        kanye_output = KANYE_OUTPUT_STDOUT;
    }
#ifdef HAVE_LIBNOTIFY
    else if (strcmp(kanye_output_env, "notify") == 0) {
        kanye_output = KANYE_OUTPUT_NOTIFY;
    }
#endif

#ifdef HAVE_LIBNOTIFY
    if (kanye_output == KANYE_OUTPUT_NOTIFY) {
        kanye_notify_init();
    }
#endif
}

void kanye_drag_off_stage()
{
#ifdef HAVE_LIBNOTIFY
    if (kanye_output == KANYE_OUTPUT_NOTIFY) {
        kanye_notify_uninit();
    }
#endif
}

void kanye(const char *message)
{
    if (!kanye_been_on_stage) {
        kanye_storm_stage();
    }

    switch (kanye_output) {
#ifdef HAVE_LIBNOTIFY
    case KANYE_OUTPUT_NOTIFY:
        kanye_notify(message);
        break;
#endif
    default:
        puts(message);
    }
}


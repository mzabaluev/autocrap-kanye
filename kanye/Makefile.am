if KANYE_INSTALL
lib_LTLIBRARIES = libkanye.la
noinst_LTLIBRARIES =
else
noinst_LTLIBRARIES = libkanye.la
endif

libkanye_la_SOURCES = kanye.c

libkanye_includedir = $(includedir)/libold-1.0/kanye

libkanye_include_HEADERS = kanye.h

noinst_HEADERS = l10n.h

AM_CPPFLAGS = -DLOCALEDIR=\"$(localedir)\"

libkanye_la_LIBADD =

if KANYE_NOTIFY

noinst_LTLIBRARIES += libkanye-notify.la

libkanye_notify_la_SOURCES = kanye-notify.c kanye-notify.h

libkanye_notify_la_CPPFLAGS = \
	$(AM_CPPFLAGS) $(NOTIFY_CFLAGS) -DG_LOG_DOMAIN=\"$(PACKAGE)\"
libkanye_notify_la_CFLAGS = $(CFLAG_VISIBILITY)
libkanye_notify_la_LIBADD = $(NOTIFY_LIBS)

libkanye_la_LIBADD += libkanye-notify.la

endif

libkanye_la_LIBADD += @LTLIBINTL@

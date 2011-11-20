AC_PREREQ([2.60])
AC_INIT([autocrap-kanye], [1.0])

AC_CONFIG_HEADERS([config.h])
AC_CONFIG_MACRO_DIR([m4])
AM_INIT_AUTOMAKE([foreign silent-rules color-tests])
LT_INIT([disable-shared pic-only])

# Due to a bug in m4/ltoptions.m4, the pic-only option for LT_INIT
# does not work. Checked with libtool version up to 1.4.2.
# Hack up the effect here
test "$pic_mode" = 'default' && pic_mode=yes

dnl Cross-compilation support
AC_CANONICAL_BUILD
AC_CANONICAL_HOST

dnl Checks for tools
AC_PROG_CC

gl_VISIBILITY

AM_GNU_GETTEXT([external])
AM_GNU_GETTEXT_VERSION([0.18])

dnl Dependency checks, optional features
KANYE_CHECK_IT_OUT
AM_CONDITIONAL([KANYE_NOTIFY], [test "$KANYE_HAS_LIBNOTIFY" = 'yes'])

AC_CONFIG_FILES([
  Makefile
  kanye/Makefile
  po/Makefile.in
  tests/Makefile
])
AC_OUTPUT


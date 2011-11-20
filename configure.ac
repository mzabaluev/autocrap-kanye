AC_PREREQ([2.60])
AC_INIT([autocrap-kanye], [1.0])

AC_CONFIG_HEADERS([config.h])
AC_CONFIG_MACRO_DIR([m4])
AM_INIT_AUTOMAKE([foreign silent-rules color-tests])
LT_INIT

dnl Project configuration flags
AC_MSG_CHECKING([whether to install Kanye])
AC_ARG_ENABLE([kanye-install],
  [AS_HELP_STRING([--enable-kanye-install],
     [install the Kanye library with make install])],
  [],
  [enable_kanye_install=no])
AC_MSG_RESULT([$enable_kanye_install])
AM_CONDITIONAL([KANYE_INSTALL], [test "$enable_kanye_install" = 'yes'])

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


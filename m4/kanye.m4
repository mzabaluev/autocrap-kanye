# serial 1 kanye.m4

dnl Configure checks used commonly by Kanye and its mothership project.
dnl Sets KANYE_HAS_LIBNOTIFY to yes if libnotify is available for the build
dnl and --with-notify did not disable its usage.
dnl It also sets up substitution variables KANYE_BUILD_CFLAGS and
dnl KANYE_BUILD_LIBS, which the two projects can use commonly while
dnl autocrap-rocks still links Kanye internally.
AC_DEFUN([KANYE_CHECK_IT_OUT],
[AC_REQUIRE([PKG_PROG_PKG_CONFIG])
KANYE_HAS_LIBNOTIFY=
KANYE_BUILD_CFLAGS=
KANYE_BUILD_LIBS=
AC_ARG_WITH([libnotify],
  [AS_HELP_STRING([--with-libnotify],
     [use libnotify API as an output backend [default=auto]])],
  [],
  [with_libnotify=auto])
if test "$with_libnotify" != 'no'; then
  PKG_CHECK_MODULES([NOTIFY], [libnotify >= 0.7],
    [have_libnotify=yes], [have_libnotify=no])
  if test "$have_libnotify" = 'yes'; then
    AC_DEFINE([HAVE_LIBNOTIFY], [1], [Define if you have libnotify])
    KANYE_HAS_LIBNOTIFY=yes
    KANYE_BUILD_CFLAGS='$(NOTIFY_CFLAGS)'
    KANYE_BUILD_LIBS='$(NOTIFY_LIBS)'
  else
    case $with_libnotify in
      yes)
        AC_MSG_ERROR([$NOTIFY_PKG_ERRORS])
        ;;
      auto)
        AC_MSG_WARN([Kanye will not be able to storm your screen!])
        ;;
    esac
  fi
fi
AC_SUBST([KANYE_BUILD_CFLAGS])
AC_SUBST([KANYE_BUILD_LIBS])
])dnl KANYE_CHECK_IT_OUT

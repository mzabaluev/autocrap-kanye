# serial 1 kanye.m4

dnl Configure checks used commonly by Kanye and its mothership project.
dnl Sets KANYE_HAS_LIBNOTIFY to yes if libnotify is available for the build
dnl and --with-notify did not disable its usage. Also sets substitution
dnl variables NOTIFY_CFLAGS and NOTIFY_LIBS as obtained from the
dnl package configuration file libnotify.pc.
dnl Also, sets a substitution variable KANYE_PKG_REQUIRES_PRIVATE for usage
dnl in .pc files of libraries that link Kanye internally.
AC_DEFUN([KANYE_CHECK_IT_OUT],
[AC_REQUIRE([PKG_PROG_PKG_CONFIG])
KANYE_HAS_LIBNOTIFY=
KANYE_PKG_REQUIRES_PRIVATE=
libnotify_min_version='0.7'
AC_ARG_WITH([libnotify],
  [AS_HELP_STRING([--with-libnotify],
     [use libnotify API as an output backend [default=auto]])],
  [],
  [with_libnotify=auto])
if test "$with_libnotify" != 'no'; then
  PKG_CHECK_MODULES([NOTIFY], [libnotify >= ${libnotify_min_version}],
    [have_libnotify=yes], [have_libnotify=no])
  if test "$have_libnotify" = 'yes'; then
    AC_DEFINE([HAVE_LIBNOTIFY], [1], [Define if you have libnotify])
    KANYE_HAS_LIBNOTIFY=yes
    KANYE_PKG_REQUIRES_PRIVATE="libnotify >= ${libnotify_min_version}"
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
AC_SUBST([KANYE_PKG_REQUIRES_PRIVATE])
])dnl KANYE_CHECK_IT_OUT

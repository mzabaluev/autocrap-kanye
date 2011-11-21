check_PROGRAMS = test-kanye

TESTS = $(check_PROGRAMS)

TESTS_ENVIRONMENT = KANYE_OUTPUT=stdout

AM_CPPFLAGS = -I$(top_srcdir)

test_kanye_SOURCES = kanye-test.c

test_kanye_LDADD = ../kanye/libkanye.la

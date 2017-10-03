AC_PREREQ([2.69])

dnl ***********************************************************************
dnl Define Versioning Information
dnl ***********************************************************************
m4_define([major_version],[3])
m4_define([minor_version],[0])
m4_define([micro_version],[0])
m4_define([package_version],[major_version.minor_version.micro_version])
m4_define([bug_report_url],[https://bugs.launchpad.net/youtube-dlhelper])
m4_define([package_url],[https://launchpad.net/youtube-dlhelper])
m4_define([maintainers_email],[Sascha.Manns@mailbox.org])
m4_define([download_page],[https://launchpad.net/youtube-dlhelper/3.x/3.0.0/+download/youtube_dlhelper_3.0.0.tar.xz])
m4_define([doc_page],[https://saigkill.tuxfamily.org/docs/youtube_dlhelper/en-US/html/])
m4_define([answers_page],[https://answers.launchpad.net/youtube-dlhelper])
m4_define([team],[https://launchpad.net/~youtube-dlhelper])
m4_define([api_version],[major_version])

AX_IS_RELEASE([micro_version])


dnl ***********************************************************************
dnl Initialize autoconf
dnl ***********************************************************************
AC_INIT([youtube_dlhelper],
        [package_version],
        [bug_report_url],
        [youtube_dlhelper],
        [package_url])
AC_CONFIG_HEADERS([config.h])
AC_CONFIG_SRCDIR([NEWS])
AC_CONFIG_MACRO_DIR([m4])
AC_CONFIG_AUX_DIR([build-aux])
AC_USE_SYSTEM_EXTENSIONS
AC_SUBST([ACLOCAL_AMFLAGS], "-I m4")
AC_CANONICAL_HOST


dnl ***********************************************************************
dnl Make information available to autoconf files
dnl ***********************************************************************
AC_SUBST([MAJOR_VERSION],major_version)
AC_SUBST([MINOR_VERSION],minor_version)
AC_SUBST([MICRO_VERSION],micro_version)
AC_SUBST([API_VERSION],api_version)
AC_SUBST([PACKAGE_URL],package_url)
AC_SUBST([BUG_REPORT_URL],bug_report_url)
AC_SUBST([MAINTAINERS_EMAIL],maintainers_email)
AC_SUBST([DOWNLOAD_PAGE],download_page)
AC_SUBST([ANSWERS_PAGE],answers_page)
AC_SUBST([DOC_PAGE],doc_page)
AC_SUBST([TEAM],team)


dnl ***********************************************************************
dnl Initialize automake
dnl ***********************************************************************
AM_SILENT_RULES([yes])
AM_INIT_AUTOMAKE([1.11 foreign subdir-objects tar-ustar no-dist-gzip dist-xz -Wno-portability])
AM_MAINTAINER_MODE([enable])


dnl ***********************************************************************
dnl Check for required programs
dnl ***********************************************************************
AC_PROG_INSTALL
AC_PROG_SED
AC_PATH_PROG([XSLTPROC], [xsltproc], [notfound])
PKG_PROG_PKG_CONFIG([0.22])

dnl ***********************************************************************
dnl Process .in Files
dnl ***********************************************************************
AC_CONFIG_FILES([
	Makefile
	README.md
	bin/Makefile
	data/Makefile
	data/youtube_dlhelper/Makefile
	docbook/youtube_dlhelper/en-US/youtube_dlhelper.ent
	etc/Makefile
	lib/Makefile
	lib/youtube_dlhelper.rb
	lib/youtube_dlhelper/Makefile
	man/Makefile
	man/youtube_dlhelper.xml
    spec/Makefile
],[],
[API_VERSION='$API_VERSION'])
AC_OUTPUT

echo ""
echo " ${PACKAGE} - ${VERSION}"
echo ""
echo " Options"
echo ""
echo "  Prefix ............................... : ${prefix}"
echo "  Libdir ............................... : ${libdir}"
echo ""
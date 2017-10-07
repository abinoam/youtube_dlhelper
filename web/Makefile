WEBDIR ?= ${HOME}/RubymineProjects/youtube_dlhelper/youtube_dlhelper/docs
IMGDIR = ${WEBDIR}/images
DISTDIR = ${WEBDIR}/dist
DOCSDIR = ${WEBDIR}/docs

#using python2.4 now (2007/04/19)
PYTHON = python
PROCESSOR = ${PYTHON} stp.py

SRC_PAGES = 			\
	sources.src 		\
	index.src 		\
	registration.src	\
	news.src

HTML_PAGES = $(patsubst %.src, ${WEBDIR}/%.html, ${SRC_PAGES})

COMMON_PAGES = head.src foot.src newsitems.py feed.py
CSS_FILES = default.css

all: start_log pages finish_log

html: ${HTML_PAGES}

pages: dirs news.rss ${HTML_PAGES} extras

dirs: ${WEBDIR} ${IMGDIR} ${DISTDIR} ${DOCSDIR}

start_log:
	echo 'Starting to build the gnome-publisher web'

finish_log:
	echo 'gnome-publisher web finished'

${WEBDIR}:
	mkdir -p ${WEBDIR}

${IMGDIR}:
	mkdir -p ${IMGDIR}

${DISTDIR}:
	mkdir -p ${DISTDIR}

${DOCSDIR}:
	mkdir -p ${DOCSDIR}

${HTML_PAGES}: ${SRC_PAGES} ${COMMON_PAGES}

${WEBDIR}/%.html: %.src
	${PROCESSOR} $< > $@

news.rss: newsitems.py feed.py
	${PYTHON} feed.py

extras: ${CSS_FILES} ${STATIC_PAGES} images/*.png images/*.svg
	-cp ${CSS_FILES} ${WEBDIR}
	-cp images/*.png ${IMGDIR}
	-cp images/*.svg ${IMGDIR}
	-cp news.rss ${WEBDIR}
	-cp .htaccess ${WEBDIR}/.htaccess

CLEANFILES: \
	news.rss \
	newsitems.src \
	newsitems-index.src \
	newsitems.pyc \
	${HTML_PAGES}

clean:
	-rm -f ${CLEANFILES}

.PHONY: all dirs extras pages start_log finish_log

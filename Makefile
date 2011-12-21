VERSION=0.1
PREFIX?=/usr
DESTDIR?=

all:

install:
	mkdir -p ${DESTDIR}${PREFIX}/bin
	ln -fs $${PWD}/slpm ${DESTDIR}${PREFIX}/bin/slpm
	ln -fs $${PWD}/slpm-genpkg ${DESTDIR}${PREFIX}/bin/slpm-genpkg
	ln -fs $${PWD}/slpm-genimg ${DESTDIR}${PREFIX}/bin/slpm-genimg

uninstall deinstall:
	rm -f ${DESTDIR}${PREFIX}/bin/slpm
	rm -f ${DESTDIR}${PREFIX}/bin/slpm-genpkg
	rm -f ${DESTDIR}${PREFIX}/bin/slpm-genimg

pull:
	wget http://lolcathost.org/slpm-${VERSION}.tar.gz
	tar xzvf slpm-${VERSION}.tar.gz
	cp slpm-${VERSION}/slpm .
	cp slpm-${VERSION}/pkg/* pkg
	rm -rf slpm-${VERSION}*

push:
	${MAKE} dist
	pub slpm-${VERSION}.tar.gz


dist:
	rm -rf slpm-${VERSION}
	hg clone . slpm-${VERSION}
	rm -rf slpm-${VERSION}/.hg
	tar czvf slpm-${VERSION}.tar.gz slpm-${VERSION}
	rm -rf slpm-${VERSION}

PREFIX=/usr
# Where the script binary should go
BINPATH = $(PREFIX)/bin
SBINPATH = $(PREFIX)/sbin
MANPATH = $(PREFIX)/share/man
SHAREDIR = $(PREFIX)/share/smailq
CONFFILE = $(SHAREDIR)/smailq.conf.sample

######################################################################

all: manpage

install: all
	install -m 0755 smailq $(BINPATH)/smailq
	install -m 0755 mailq $(BINPATH)/mailq
	install -m 0755 sendmail $(SBINPATH)/sendmail
	mkdir -p $(SHAREDIR)
	install -m 0644 smailq.conf $(CONFFILE)
	install -m 0644 smailq.1 $(MANPATH)/man1/smailq.1
	bzip2 -f $(MANPATH)/man1/smailq.1

manpage: smailq.1

smailq.1: smailq.docbook
	docbook2man.pl $<
	#groff -t -e -mandoc -Tps smailq.1 > smailq.ps



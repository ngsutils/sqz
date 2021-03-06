#!/bin/sh
MYSELF=`which "$0" 2>/dev/null`
if [ "$?" -gt 0 ]; then
	MYSELF="./$0"
fi

if [ -e $(dirname $0)/.sqzrc ]; then
    . $(dirname $0)/.sqzrc
fi
if [ -e $HOME/.sqzrc ]; then
    . $HOME/.sqzrc
fi

if [ ! -t 0 ]; then 
    JAVA_OPTS="${JAVA_OPTS} -Dorg.ngsutils.support.tty.fd0=F"
fi

if [ ! -t 1 ]; then 
    JAVA_OPTS="${JAVA_OPTS} -Dorg.ngsutils.support.tty.fd1=F"
fi

if [ ! -t 2 ]; then 
    JAVA_OPTS="${JAVA_OPTS} -Dorg.ngsutils.support.tty.fd2=F"
fi

JAVABIN=`which java`
if [ "${JAVA_HOME}" != "" ]; then
    JAVABIN="$JAVA_HOME/bin/java"
fi
exec "${JAVABIN}" ${JAVA_OPTS} -jar $0 "$@"
exit 1

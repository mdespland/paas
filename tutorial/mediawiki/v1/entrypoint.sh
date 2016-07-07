#!/bin/bash
CANT_START=0

# check environement variables
if [ -z ${MYSQL_ROOT_PASSWORD+x} ]; then
	echo "MYSQL_ROOT_PASSWORD is not set"
	CANT_START=1
fi
if [ -z ${MEDIAWIKI_DATABASE_NAME+x} ]; then
	echo "MEDIAWIKI_DATABASE_NAME is not set"
	CANT_START=1
fi
if [ -z ${MEDIAWIKI_DATABASE_SERVER+x} ]; then
	echo "MEDIAWIKI_DATABASE_SERVER is not set"
	CANT_START=1
fi
if [ -z ${MEDIAWIKI_DATABASE_USER+x} ]; then
	echo "MEDIAWIKI_DATABASE_USER is not set"
	CANT_START=1
fi
if [ -z ${MEDIAWIKI_DATABASE_PASSWORD+x} ]; then
	echo "MEDIAWIKI_DATABASE_PASSWORD is not set"
	CANT_START=1
fi
if [ -z ${MEDIAWIKI_NAME+x} ]; then
	echo "MEDIAWIKI_NAME is not set"
	CANT_START=1
fi
if [ -z ${MEDIAWIKI_ADMIN_PASSWORD+x} ]; then
	echo "MEDIAWIKI_ADMIN_PASSWORD is not set"
	CANT_START=1
fi
if [ $CANT_START = 1 ] ; then
	exit 0
fi

# The first start we have to configure mediawiki
if [ ! -e /var/www/done/mediawiki.configured ] ; then
	# Here we have to configure Mediawiki
	touch /var/www/done/mediawiki.configured
	cd /var/www/html/mediawiki; php ./maintenance/install.php  --dbuser $MEDIAWIKI_DATABASE_USER --dbpass $MEDIAWIKI_DATABASE_PASSWORD --dbname $MEDIAWIKI_DATABASE_NAME --scriptpath /mediawiki --dbserver $MEDIAWIKI_DATABASE_SERVER --dbtype mysql --installdbpass $MYSQL_ROOT_PASSWORD --installdbuser root --pass $MEDIAWIKI_ADMIN_PASSWORD $MEDIAWIKI_NAME admin
fi

. /etc/apache2/envvars
exec /usr/sbin/apache2 -DFOREGROUND
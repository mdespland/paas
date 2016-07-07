#!/bin/bash
# The first start we have to configure mediawiki
if [ ! -e /var/www/done/mediawiki.configured ] ; then
	# Here we have to configure Mediawiki
	touch /var/www/done/mediawiki.configured
	cd /var/www/html/mediawiki; php ./maintenance/install.php  --dbuser mediawiki --dbpass password --dbname mediawiki --scriptpath /mediawiki --dbserver mediawikidb --dbtype mysql --installdbpass password --installdbuser root --pass password Demo admin
fi

. /etc/apache2/envvars
exec /usr/sbin/apache2 -DFOREGROUND
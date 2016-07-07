FROM tutorial/apache-php:v1
MAINTAINER Marc Despland <marc.despland.com>
USER root
RUN apt-get update &&  apt-get install -y php-xml php-imagick imagemagick php-intl
ADD mediawiki-1.26.3.tar.gz /tmp/
RUN rm /var/www/html/index.html
RUN mv /tmp/mediawiki-1.26.3 /var/www/html/mediawiki
RUN chown -R root:root /var/www/html/mediawiki;chmod a+rwx /var/www/html/mediawiki
USER www-data

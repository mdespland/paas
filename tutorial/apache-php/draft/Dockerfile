FROM ubuntu
MAINTAINER Marc Despland <marc.despland.com>
RUN apt-get update && apt-get install -y apache2 php libapache2-mod-php php-mcrypt php-mysql
EXPOSE 80
CMD . /etc/apache2/envvars; /usr/sbin/apache2 -DFOREGROUND
